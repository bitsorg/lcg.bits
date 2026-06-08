package: mcfm
description: MCFM Monte Carlo for FeMtobarn processes (NLO parton-level)
version: "10.3.atlas"
tag: "10.3.atlas"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MCFM-10.3.tar.gz
requires:
  - CMake
  - lhapdf
  # macOS: MCFM's C++ uses OpenMP (qcdloop, CXX_Wrapper, cxx11_random) via
  # unguarded omp_* calls; Apple clang has no OpenMP runtime, so pull in
  # Homebrew's keg-only libomp on macOS only (Linux uses gfortran's libgomp).
  - "libomp:osx"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MCFM
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: MCFM's CMakeLists only accepts GNU/Intel for C and C++ and aborts on
  # AppleClang ("Unsupported C++ compiler"). The rest of the stack — and MCFM's
  # std::-typed CXX_Interface consumers (Sherpa) — use AppleClang/libc++, so we
  # build C/C++ with AppleClang too. Teach the CMake checks the Clang spelling
  # (-Xclang -fopenmp), and supply OpenMP from Homebrew's keg-only libomp
  # (LIBOMP_ROOT, via the libomp:osx dependency), since Apple clang ships none.
  # The Fortran side keeps gfortran + libgomp. Idempotent (guarded on the marker).
  local _omp=()
  if [ "$(uname)" = Darwin ]; then
    python3 - "${SOURCEDIR}/CMakeLists.txt" <<'PY'
import sys
p = sys.argv[1]
s = open(p).read()
# (compiler-id language, flags var, message label); the C++ message says "C++".
blocks = (("CXX", "CMAKE_CXX_FLAGS", "C++"), ("C", "CMAKE_C_FLAGS", "C"))
if 'MATCHES "Clang"' not in s:
    for idlang, fv, label in blocks:
        needle = 'else()\n    message( FATAL_ERROR "Unsupported %s compiler' % label
        repl = ('elseif (CMAKE_%s_COMPILER_ID MATCHES "Clang")\n'
                '    set(%s "${%s} -Xclang -fopenmp")\n'
                'else()\n    message( FATAL_ERROR "Unsupported %s compiler'
                % (idlang, fv, fv, label))
        s = s.replace(needle, repl, 1)
    open(p, "w").write(s)
PY
    local _lomp="${LIBOMP_ROOT:-$(brew --prefix libomp 2>/dev/null)}"
    _omp=(
      -DCMAKE_C_FLAGS="-I${_lomp}/include"
      -DCMAKE_CXX_FLAGS="-I${_lomp}/include"
      -DCMAKE_EXE_LINKER_FLAGS="-L${_lomp}/lib -lomp -Wl,-headerpad_max_install_names"
      -DCMAKE_SHARED_LINKER_FLAGS="-L${_lomp}/lib -lomp -Wl,-headerpad_max_install_names"
    )
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Duse_internal_lhapdf=OFF \
    -Dlhapdf_include_path="${LHAPDF_ROOT}/include" \
    -Dwith_library=ON \
    "${_omp[@]}"
}
function Make() {
  # handyG (a CMake sub-project of MCFM) has a missing Fortran-module dependency:
  # under parallel make, gpl_module.f is compiled before maths_functions.mod has
  # finished being written, giving
  #   File 'build/maths_functions.mod' ... is not a GNU Fortran module file
  # Build only handyG (and its bundled qd) serially, then the rest of MCFM --
  # which parallelises fine (e.g. vvamp) -- with the full job count. If the
  # 'handyg' target name is ever unavailable, fall back to a fully serial build
  # (the known-good behaviour) rather than failing.
  if cmake --build . --target handyg -- -j1; then
    cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
  else
    echo "bits: 'handyg' target unavailable; falling back to a full serial build" >&2
    cmake --build . -- ${CMAKE_OPTIONS} -j1
  fi
}
function PostInstall() {
  # MCFM's own cmake install does not expose the library/headers the way
  # consumers expect (Sherpa's FindMCFM searches for MCFM/CXX_Interface.h and a
  # library named 'mcfm' or 'MCFM'). Mirror lcgcmake: install the CXX interface
  # headers under include/MCFM and the library under BOTH names. PostInstall runs
  # in the build directory, so search it (and the install lib) for libmcfm.so.
  mkdir -p "${INSTALLROOT}/include" "${INSTALLROOT}/lib"
  [ -d "${SOURCEDIR}/src/Inc/MCFM" ] && cp -rf "${SOURCEDIR}/src/Inc/MCFM" "${INSTALLROOT}/include/"
  local _ext _lib
  _ext=so; [ "$(uname)" = Darwin ] && _ext=dylib
  _lib="$(find . "${INSTALLROOT}/lib" \( -name 'libmcfm.so' -o -name 'libmcfm.dylib' \) -print -quit 2>/dev/null)"
  if [ -n "${_lib}" ]; then
    cp -f "${_lib}" "${INSTALLROOT}/lib/libmcfm.${_ext}"
    cp -f "${_lib}" "${INSTALLROOT}/lib/libMCFM.${_ext}"
  fi
}
