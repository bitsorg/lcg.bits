package: ROOT
description: CERN ROOT data analysis framework
version: "v6.36.04"
tag: "v6-36-04"
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
  - vdt
  - xz
  - cfitsio
  - jsonmcpp
  - gl2ps
  - Vc
  - protobuf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake --pylib"
##############################
function Prepare() {
  # All source patches must come BEFORE rsync.  ROOT's cmake copies LLVM headers
  # from the build dir's rsync'd tree (not from SOURCEDIR) into its own build/
  # subtree; if we patch after rsync, the build dir gets the unpatched copy.

  # ROOT's CMakeLists.txt does set(CMAKE_MODULE_PATH ...) which replaces any
  # -DCMAKE_MODULE_PATH passed on the command line, so we must patch the source.
  # FindDavix.cmake uses only pkg_check_modules; prepend a find_library fallback
  # via DAVIX_ROOT so discovery works even when davix.pc is absent or misplaced.
  # Guard prevents double-patching on reruns.
  if ! grep -q 'bits: direct fallback' "${SOURCEDIR}/cmake/modules/FindDavix.cmake"; then
    sed -i 's|^find_package(PkgConfig)$|# bits: direct fallback via DAVIX_ROOT cmake var or env var\nif(NOT DAVIX_FOUND AND (DEFINED DAVIX_ROOT OR DEFINED ENV{DAVIX_ROOT}))\n  if(DEFINED DAVIX_ROOT)\n    set(_davix_root ${DAVIX_ROOT})\n  else()\n    set(_davix_root $ENV{DAVIX_ROOT})\n  endif()\n  find_path(DAVIX_INCLUDE_DIR davix/davix.hpp PATHS ${_davix_root}/include NO_DEFAULT_PATH)\n  find_library(DAVIX_LIBRARY NAMES davix PATHS ${_davix_root}/lib ${_davix_root}/lib64 NO_DEFAULT_PATH)\n  if(DAVIX_INCLUDE_DIR AND DAVIX_LIBRARY)\n    set(DAVIX_FOUND TRUE)\n    set(DAVIX_INCLUDE_DIRS ${DAVIX_INCLUDE_DIR})\n    set(DAVIX_LIBRARIES ${DAVIX_LIBRARY})\n    set(DAVIX_LIBRARY ${DAVIX_LIBRARY})\n    message(STATUS "Found Davix via DAVIX_ROOT: ${DAVIX_LIBRARY}")\n  endif()\nendif()\nfind_package(PkgConfig)|' "${SOURCEDIR}/cmake/modules/FindDavix.cmake"
  fi
  # rsync last: copies the already-patched source into the build dir
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}/" ./
}
function Configure() {
  # Default ROOT_TESTING to OFF unless set externally
  ROOT_TESTING=${ROOT_TESTING:-OFF}

  # Detect C++ standard from environment before unsetting flags
  CMAKE_CXX_STANDARD=17
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

  # FindDavix.cmake uses only pkg_check_modules — no cmake-variable fallback.
  # Locate davix.pc wherever it landed (lib/pkgconfig or lib/*/pkgconfig on
  # Ubuntu multiarch) and prepend that directory to PKG_CONFIG_PATH.
  if [[ -n "${DAVIX_ROOT}" ]]; then
    _davix_pc=$(find "${DAVIX_ROOT}/lib" "${DAVIX_ROOT}/lib64" -name 'davix.pc' -print -quit 2>/dev/null)
    [[ -n "$_davix_pc" ]] && export PKG_CONFIG_PATH="$(dirname "$_davix_pc")${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  fi

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
      ENABLE_COCOA="-Dcocoa=ON"
      COMPILER_CXX=clang++
      COMPILER_CC=clang
      [[ ! $OPENSSL_ROOT ]] && OPENSSL_ROOT=$(brew --prefix openssl@3 2>/dev/null) || true
      ;;
  esac

  # Python discovery: do NOT pass Python3_ROOT_DIR or Python3_EXECUTABLE to cmake.
  # ROOT's cmake uses FindPython3 with COMPONENTS Interpreter Development NumPy.
  # When Python3_ROOT_DIR is set, cmake enables NO_DEFAULT_PATH and bypasses the
  # sysconfig-based library search; this breaks library discovery for non-standard
  # Python builds (e.g. Python 3.14 on macOS).
  # Instead, rely on PATH: the Python module's --bin flag prepends $PYTHON_ROOT/bin,
  # so cmake finds the right python3 on PATH and uses sysconfig to discover the
  # include dir and libpython location automatically — exactly as lcgcmake does.

  # Build PYTHONPATH before calling cmake.  bits' init.sh automatically adds
  # $PKG_ROOT/bin to PATH and $PKG_ROOT/lib to LD_LIBRARY_PATH for every dep,
  # but does NOT propagate lib/pythonX.Y/site-packages to PYTHONPATH (that is
  # only done in the TCL module files used post-install, not during builds).
  # Without PYTHONPATH, cmake's FindPython3 cannot run
  #   "import numpy; numpy.get_include()"
  # and the NumPy component detection fails, blocking tmva-pymva.
  # We replicate PythonRecipe's approach: query the interpreter for the exact
  # version, then scan every *_ROOT env var for a matching site-packages dir.
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
  if _ver_ge "$_root_ver" "6.40.00"; then
    _builtin_flags="-Dbuiltin_ftgl=OFF -Dbuiltin_gif=OFF -Dbuiltin_glew=OFF -Dbuiltin_lz4=OFF -Dbuiltin_pcre=OFF -Dbuiltin_unuran=OFF -Dbuiltin_xxhash=OFF -Dbuiltin_zstd=OFF -Dcurl=ON"
  else
    _builtin_flags="-Dbuiltin_ftgl=ON -Dbuiltin_gif=ON -Dbuiltin_glew=ON -Dbuiltin_lz4=ON -Dbuiltin_pcre=ON -Dbuiltin_unuran=ON -Dbuiltin_xxhash=ON -Dbuiltin_zstd=ON"
  fi

  # < 6.36.99: explicit pgsql=OFF; >= 6.36.99: roottest flag replaces it
  if _ver_ge "$_root_ver" "6.36.99"; then
    _test_flags="-Droottest=${ROOT_TESTING}"
  else
    _test_flags="-Dpgsql=OFF"
  fi

  # Vc SIMD acceleration: Linux only, ROOT < 6.40, when Vc dep is loaded
  _vc_flag=""
  if [[ $(uname) != Darwin ]] && ! _ver_ge "$_root_ver" "6.40.00" && [[ -n "${VC_ROOT}" ]]; then
    _vc_flag="-Dvc=ON"
  fi

  # SOFIE ONNX model importer: enabled when protobuf is available.
  # Also pass Protobuf_ROOT and absl_ROOT so protobuf's cmake config can resolve
  # find_dependency(absl) and create the absl::strings target required by
  # utf8_range-targets.cmake.  absl is a transitive dep (via protobuf) so
  # ABSL_ROOT is set in the environment but invisible to cmake due to CMP0144.
  _sofie_flag=""
  if [[ -n "${PROTOBUF_ROOT}" ]]; then
    _sofie_flag="-Dtmva-sofie=ON -DProtobuf_ROOT=${PROTOBUF_ROOT}"
    [[ -n "${ABSL_ROOT}" ]] && _sofie_flag+=" -Dabsl_ROOT=${ABSL_ROOT}"
  fi

  unset DYLD_LIBRARY_PATH

  cmake "${SOURCEDIR}"                                                      \
    ${CMAKE_GENERATOR:+-G "${CMAKE_GENERATOR}"}                             \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}"                                 \
    -DCMAKE_BUILD_TYPE=Release                                              \
    -DCMAKE_INSTALL_LIBDIR=lib                                              \
    -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}                             \
    -DCMAKE_C_STANDARD=17                                                   \
    -DCMAKE_CXX_FLAGS=" -fpermissive "                                      \
    -DCMAKE_CXX_COMPILER=${COMPILER_CXX}                                   \
    -DCMAKE_C_COMPILER=${COMPILER_CC}                                      \
    ${ENABLE_COCOA}                                                         \
    -Dcheck_connection=OFF                                                  \
    -Dfail-on-missing=ON                                                    \
    -DCINTLONGLINE=4096                                                     \
    -DCINTMAXSTRUCT=36000                                                   \
    -DCINTMAXTYPEDEF=36000                                                  \
    ${OPENSSL_ROOT:+-DOPENSSL_ROOT=$OPENSSL_ROOT}                           \
    ${OPENSSL_ROOT:+-DOPENSSL_INCLUDE_DIR=$OPENSSL_ROOT/include}            \
    ${GSL_ROOT:+-DGSL_ROOT_DIR=$GSL_ROOT}                                   \
    ${ZLIB_ROOT:+-DZLIB_ROOT=$ZLIB_ROOT}                                    \
    ${FFTW_ROOT:+-DFFTW_DIR=$FFTW_ROOT}                                     \
    -Dbuiltin_fftw3=OFF                                                     \
    ${LIBXML2_ROOT:+-DLIBXML2_ROOT=$LIBXML2_ROOT}                           \
    ${TBB_ROOT:+-DTBB_ROOT_DIR=$TBB_ROOT}                                   \
    ${CFITSIO_ROOT:+-DCFITSIO_ROOT=$CFITSIO_ROOT}                           \
    ${XZ_ROOT:+-DLIBLZMA_ROOT=$XZ_ROOT}                                     \
    -Ddavix=ON                                                              \
    -Dbuiltin_davix=OFF                                                     \
    ${DAVIX_ROOT:+-DDAVIX_ROOT=$DAVIX_ROOT}                                 \
    ${JSONMCPP_ROOT:+-Dnlohmann_json_ROOT=$JSONMCPP_ROOT}                   \
    -Dbuiltin_nlohmannjson=OFF                                              \
    ${GL2PS_ROOT:+-Dgl2ps_ROOT=$GL2PS_ROOT}                                 \
    ${VC_ROOT:+-DVc_ROOT=$VC_ROOT}                                          \
    ${VDT_ROOT:+-DVDT_INCLUDE_DIR=$VDT_ROOT/include}                        \
    ${_vdt_lib:+-DVDT_LIBRARY=$_vdt_lib}                                    \
    -Dxrootd=ON                                                             \
    ${XROOTD_ROOT:+-DXROOTD_ROOT_DIR=$XROOTD_ROOT}                         \
    ${_builtin_flags}                                                       \
    -Dcintex=ON                                                             \
    -Dexplicitlink=ON                                                       \
    -Dfftw3=ON                                                              \
    -Dfitsio=ON                                                             \
    -Dfortran=ON                                                            \
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
    -Dtesting=${ROOT_TESTING}                                               \
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
    ${_sofie_flag}                                                          \
    ${_vc_flag}                                                             \
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

  # Append ROOT-specific env vars to the ModuleRecipe-generated modulefile.
  # ModuleRecipe (--bin --lib --cmake --pylib) already adds PATH, LD_LIBRARY_PATH,
  # CMAKE_PREFIX_PATH, PYTHONPATH, ROOT_ROOT, and ROOT_INCLUDE_DIR.
  # We append the variables that ROOT users and dependent packages additionally need.
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv ROOTSYS $PKG_ROOT
setenv ROOT_RELEASE $version
prepend-path ROOT_DYN_PATH $PKG_ROOT/lib
prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include
EoF
}
