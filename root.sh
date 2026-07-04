package: ROOT
description: CERN ROOT data analysis framework
version: "v6.38.00"
tag: "v6-38-00"
source: https://github.com/root-project/root.git
mem_per_job: 1500
requires:
  - CMake
  - Python
  - fftw
  - GSL
  - OpenSSL
  - xrootd
  - Davix
  - numpy
  - tbb
  - blas
  - zlib
  - libxml2
  - "vdt:(?!osx)"
  - "unuran:osx"
  - xz
  - cfitsio
  - jsonmcpp
  - gl2ps
  - protobuf
  - jpeg
  - tiff
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
env:
  ROOTSYS: "$ROOT_ROOT"
prepend_path:
  ROOT_DYN_PATH: "$ROOT_ROOT/lib"
  ROOT_INCLUDE_PATH: "$ROOT_ROOT/include"
  PYTHONPATH: "$ROOT_ROOT/lib"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --cmake --pylib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded --exclude '/build/' "${SOURCEDIR}/" ./

  _cling_cm="interpreter/cling/lib/Interpreter/CMakeLists.txt"
  if bits_is_macos && [ -f "${_cling_cm}" ] \
     && ! grep -q 'bits: InterpreterCallbacks rtti' "${_cling_cm}"; then
    perl -i -pe 's{^(\s*set_source_files_properties\(Exception\.cpp COMPILE_FLAGS.*\))}{$1\n  # bits: InterpreterCallbacks rtti (Clang -fno-rtti omits typeinfo; GCC keeps it)\n  set_source_files_properties(InterpreterCallbacks.cpp COMPILE_FLAGS "-frtti")}' "${_cling_cm}"
  fi
}
function Configure() {
  # Default ROOT_TESTING to OFF unless set externally
  ROOT_TESTING=${ROOT_TESTING:-OFF}

  # Default to C++20 (podio etc. need it) but honour an explicit -std=c++NN in
  # CXXFLAGS so stacks that pin an older standard are not silently upgraded.
  CMAKE_CXX_STANDARD=20
  [[ "$CXXFLAGS" == *'-std=c++11'* ]] && CMAKE_CXX_STANDARD=11 || true
  [[ "$CXXFLAGS" == *'-std=c++14'* ]] && CMAKE_CXX_STANDARD=14 || true
  [[ "$CXXFLAGS" == *'-std=c++17'* ]] && CMAKE_CXX_STANDARD=17 || true
  [[ "$CXXFLAGS" == *'-std=c++20'* ]] && CMAKE_CXX_STANDARD=20 || true
  [[ "$CXXFLAGS" == *'-std=c++23'* ]] && CMAKE_CXX_STANDARD=23 || true

  # Version-gated cmake flags (strip leading 'v' from PKGVERSION for sorting)
  _root_ver="${PKGVERSION#v}"
  # _ver_ge A B: true if version A >= version B
  _ver_ge() { [[ "$(printf '%s\n' "$1" "$2" | sort -V | head -1)" == "$2" ]]; }

  # ROOT must not see these or it picks up wrong flags
  unset ROOTSYS CXXFLAGS CFLAGS LDFLAGS

  # Expose xrootd location via the env var ROOT's cmake actually checks
  [[ -n "${XROOTD_ROOT}" ]] && export XRDSYS="${XROOTD_ROOT}"

  # Davix is found by ROOT's stock FindDavix via pkg_check_modules; davix.pc is
  # on PKG_CONFIG_PATH from Davix's init.sh (--pkgconfig), so no shim is needed.

  # FindVdt.cmake uses plain find_path/find_library with no hint variables and
  # VDT installs no cmake config or pkg-config files.  Pre-set the exact cache
  # variables FindVdt expects so cmake skips the search entirely.
  if [[ -n "${VDT_ROOT}" ]]; then
    _vdt_lib=$(find "${VDT_ROOT}/lib" "${VDT_ROOT}/lib64" \( -name 'libvdt.so' -o -name 'libvdt.dylib' \) -print -quit 2>/dev/null)
  fi

  # Platform and compiler settings — use system cc/c++ on Linux, Xcode clang on macOS.
  ENABLE_COCOA=""
  COMPILER_CC=cc
  COMPILER_CXX=c++
  case $(uname) in
    Darwin)
      # Native Cocoa GUI backend, X11 off, so ROOT doesn't need XQuartz on macOS.
      ENABLE_COCOA="-Dcocoa=ON -Dx11=OFF"
      COMPILER_CXX=clang++
      COMPILER_CC=clang
      [[ ! $GSL_ROOT ]] && GSL_ROOT=$(brew --prefix gsl 2>/dev/null) || true
      [[ ! $LIBPNG_ROOT ]] && LIBPNG_ROOT=$(brew --prefix libpng 2>/dev/null) || true
      [[ ! $OPENSSL_ROOT ]] && OPENSSL_ROOT=$(brew --prefix openssl@3 2>/dev/null) || true
      ;;
  esac

  # Do NOT pass Python3_ROOT_DIR: it enables NO_DEFAULT_PATH and breaks libpython
  # discovery for non-standard builds. Rely on PATH ($PYTHON_ROOT/bin via --bin)
  # so cmake's FindPython3 uses sysconfig, as lcgcmake does.

  # init.sh doesn't put deps' site-packages on PYTHONPATH at build time, so
  # FindPython3's NumPy probe fails (blocks tmva-pymva). Query the interpreter
  # version, then scan *_ROOT env vars for matching site-packages dirs.
  if [[ -n "${PYTHON_ROOT}" ]]; then
    _pyver=$("${PYTHON_ROOT}/bin/python3" -c \
      'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null || true)
    if [[ -n "${_pyver}" ]]; then
      for _rv in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
        _sp="${!_rv}/lib/python${_pyver}/site-packages"
        [[ -d "${_sp}" ]] && export PYTHONPATH="${_sp}${PYTHONPATH:+:${PYTHONPATH}}" || true
      done
    fi
    unset _pyver _rv _sp
  fi

  # < 6.40: use builtin copies; >= 6.40: switch to external packages + curl
  # (unuran is provided as an external dep on macOS, where 6.40 is built).
  if _ver_ge "$_root_ver" "6.40.00"; then
    _builtin_flags="-Dbuiltin_ftgl=OFF -Dbuiltin_gif=OFF -Dbuiltin_glew=OFF -Dbuiltin_lz4=OFF -Dbuiltin_pcre=OFF -Dbuiltin_unuran=OFF -Dbuiltin_xxhash=OFF -Dbuiltin_zstd=OFF -Dcurl=ON"
  else
    _builtin_flags="-Dbuiltin_ftgl=ON -Dbuiltin_gif=ON -Dbuiltin_glew=ON -Dbuiltin_lz4=ON -Dbuiltin_pcre=ON -Dbuiltin_unuran=ON -Dbuiltin_xxhash=ON -Dbuiltin_zstd=ON"
  fi

  # < 6.36.99: explicit pgsql=OFF; >= 6.36.99: roottest flag replaces it
  if _ver_ge "$_root_ver" "6.36.99"; then
    _test_flags="-Droottest="${ROOT_TESTING}""
  else
    _test_flags="-Dpgsql=OFF"
  fi

  # SOFIE (enabled when protobuf is present): pass Protobuf_ROOT and absl_ROOT so
  # protobuf's config resolves find_dependency(absl) — absl is transitive so its
  # _ROOT is in the env but invisible to cmake under CMP0144.
  _sofie_flag=""
  if [[ -n "${PROTOBUF_ROOT}" ]]; then
    _sofie_flag="-Dtmva-sofie=ON -DProtobuf_ROOT="${PROTOBUF_ROOT}""
    [[ -n "${ABSL_ROOT}" ]] && _sofie_flag+=" -Dabsl_ROOT="${ABSL_ROOT}""
  fi

  unset DYLD_LIBRARY_PATH

  # h2root/g2root link with gfortran, whose libgfortran/libstdc++ must match the
  # C++ toolchain. The system gfortran often mismatches (el9: GCC 11 vs 14), so
  # enable Fortran only when a gfortran sits next to the C++ compiler.
  FORTRAN_FLAG="-Dfortran=OFF"
  _cxx_bin="$(command -v "$COMPILER_CXX" 2>/dev/null || true)"
  if [[ -n "$_cxx_bin" && -x "$(dirname "$_cxx_bin")/gfortran" ]]; then
    FORTRAN_FLAG="-Dfortran=ON -DCMAKE_Fortran_COMPILER=$(dirname "$_cxx_bin")/gfortran"
  fi

  # Compiler warning flags. Linux/gcc keeps the existing set; on macOS (clang)
  # drop -fpermissive (unknown to clang) and silence clang's "unknown warning
  # option" for the gcc -W flags. Darwin-gated; Linux flags are byte-identical.
  _cxx_extra=" -fpermissive -Wno-stringop-overread -Wno-stringop-overflow -Wno-deprecated-declarations "
  _c_extra=" -Wno-stringop-overread -Wno-stringop-overflow "
  if bits_is_macos; then
    _cxx_extra=" -Wno-deprecated-declarations -Wno-unknown-warning-option "
    _c_extra=" -Wno-unknown-warning-option "
  fi

  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD"                                                      \
    ${CMAKE_GENERATOR:+-G "${CMAKE_GENERATOR}"}                             \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}"                                 \
    -DCMAKE_BUILD_TYPE=Release                                              \
    -DCMAKE_INSTALL_LIBDIR=lib                                              \
    -DCMAKE_CXX_STANDARD="${CMAKE_CXX_STANDARD}"                             \
    -DCMAKE_C_STANDARD=17                                                   \
    -DCMAKE_CXX_FLAGS="${_cxx_extra}"                                       \
    -DCMAKE_C_FLAGS="${_c_extra}"                                           \
    -DCMAKE_CXX_COMPILER="${COMPILER_CXX}"                                   \
    -DCMAKE_C_COMPILER="${COMPILER_CC}"                                      \
    ${ENABLE_COCOA}                                                         \
    -Dcheck_connection=OFF                                                  \
    -Dfail-on-missing=ON                                                    \
    -DCINTLONGLINE=4096                                                     \
    -DCINTMAXSTRUCT=36000                                                   \
    -DCINTMAXTYPEDEF=36000                                                  \
    ${OPENSSL_ROOT:+-DOPENSSL_ROOT="$OPENSSL_ROOT"}                           \
    ${OPENSSL_ROOT:+-DOPENSSL_INCLUDE_DIR="$OPENSSL_ROOT/include"}            \
    ${GSL_ROOT:+-DGSL_ROOT_DIR="$GSL_ROOT"}                                   \
    ${ZLIB_ROOT:+-DZLIB_ROOT="$ZLIB_ROOT"}                                    \
    ${FFTW_ROOT:+-DFFTW_DIR="$FFTW_ROOT"}                                     \
    -Dbuiltin_fftw3=OFF                                                     \
    ${LIBXML2_ROOT:+-DLIBXML2_ROOT="$LIBXML2_ROOT"}                           \
    ${TBB_ROOT:+-DTBB_ROOT_DIR="$TBB_ROOT"}                                   \
    ${CFITSIO_ROOT:+-DCFITSIO_ROOT="$CFITSIO_ROOT"}                           \
    ${XZ_ROOT:+-DLIBLZMA_ROOT="$XZ_ROOT"}                                     \
    -Ddavix=ON                                                              \
    -Dbuiltin_davix=OFF                                                     \
    ${DAVIX_ROOT:+-DDAVIX_ROOT="$DAVIX_ROOT"}                                 \
    ${JSONMCPP_ROOT:+-Dnlohmann_json_ROOT="$JSONMCPP_ROOT"}                   \
    -Dbuiltin_nlohmannjson=OFF                                              \
    ${GL2PS_ROOT:+-Dgl2ps_ROOT="$GL2PS_ROOT"}                                 \
    ${VDT_ROOT:+-DVDT_INCLUDE_DIR="$VDT_ROOT/include"}                        \
    ${_vdt_lib:+-DVDT_LIBRARY="$_vdt_lib"}                                    \
    -Dxrootd=ON                                                             \
    ${XROOTD_ROOT:+-DXROOTD_ROOT_DIR="$XROOTD_ROOT"}                         \
    ${_builtin_flags}                                                       \
    -Dcintex=ON                                                             \
    -Dexplicitlink=ON                                                       \
    -Dfftw3=ON                                                              \
    -Dfitsio=ON                                                             \
    ${FORTRAN_FLAG}                                                         \
    -Dfreetype=ON                                                           \
    -Dbuiltin_freetype=OFF                                                  \
    -Dgdml=ON                                                               \
    -Dgenvector=ON                                                          \
    -Dgviz=OFF                                                              \
    -Dhttp=ON                                                               \
    -Dmathmore=ON                                                           \
    -Dmysql=OFF                                                             \
    -Dopengl=ON                                                             \
    -Dpgsql=OFF                                                             \
    -Dpyroot=ON                                                             \
    -Dpythia8=OFF                                                           \
    -Dr=OFF                                                                 \
    -Dreflex=ON                                                             \
    -Droofit=ON                                                             \
    -Droofit_multiprocess=OFF                                               \
    -Droot7=ON                                                              \
    -Dshadowpw=OFF                                                          \
    -Dsoversion=ON                                                          \
    -Dsqlite=OFF                                                            \
    -Dssl=ON                                                                \
    -Dtesting="${ROOT_TESTING}"                                               \
    -Dtmva-gpu=OFF                                                          \
    -Dtmva-sofie=OFF                                                        \
    -Dunfold=ON                                                             \
    -Dunuran=ON                                                             \
    -Dbuiltin_vdt=OFF                                                       \
    -Dvdt=OFF                                                               \
    -Dvc=OFF                                                                \
    -Dxft=ON                                                                \
    -Dxml=ON                                                                \
    -Dzlib=ON                                                               \
    ${VDT_ROOT:+-Dvdt=ON}                                                   \
    ${UNURAN_ROOT:+-DUNURAN_DIR="$UNURAN_ROOT"}                             \
    ${_sofie_flag}                                                          \
    ${_test_flags}
}
function PostInstall() {
  # Verify ROOT found all requested features
  [ "$("$INSTALLROOT/bin/root-config" --has-fftw3)" = yes ]

  # Add support for ROOT_PLUGIN_PATH envvar for specifying additional plugin search paths
  grep -v '^Unix.*.Root.PluginPath' "$INSTALLROOT/etc/system.rootrc" > system.rootrc.0
  cat >> system.rootrc.0 <<\EOF
# Specify additional plugin search paths via the environment variable ROOT_PLUGIN_PATH.
# Plugins in $ROOT_PLUGIN_PATH have priority.
Unix.*.Root.PluginPath: $(ROOT_PLUGIN_PATH):$(ROOTSYS)/etc/plugins:
Unix.*.Root.DynamicPath: .:$(ROOT_DYN_PATH):
EOF
  mv system.rootrc.0 "$INSTALLROOT/etc/system.rootrc"

  # Make some CMake files used by other projects relocatable
  sed -i.deleteme -e "s!$BUILDDIR!$INSTALLROOT!g" $(find "$INSTALLROOT" -name '*.cmake') || true

  rm -vf "$INSTALLROOT/LICENSE"

  # Fix python shebangs for relocatability
  for binfile in "$INSTALLROOT"/bin/*; do
    [ -f "$binfile" ] || continue
    if grep -q "^'''exec' .*python.*" "$binfile"; then
      # This file uses a hack to get around shebang size limits. Replace with a
      # normal shebang since we use /usr/bin/env python3, not an absolute path.
      sed -i.bak '1d; 2d; 3d; 4s,^,#!/usr/bin/env python3\n,' "$binfile"
    else
      sed -i.bak '1s,^#!.*python.*,#!/usr/bin/env python3,' "$binfile"
    fi
  done
  rm -fv "$INSTALLROOT"/bin/*.bak

  # Append ROOT-specific env vars to the ModuleRecipe-generated modulefile
  # (--bin --lib --cmake --pylib already handles PATH/LD_LIBRARY_PATH/etc.).
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv ROOTSYS $PKG_ROOT
setenv ROOT_RELEASE $version
prepend-path ROOT_DYN_PATH $PKG_ROOT/lib
prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include
EoF
}
