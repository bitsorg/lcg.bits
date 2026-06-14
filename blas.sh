package: blas
description: Basic Linear Algebra Subprograms reference implementation
version: "0.3.32"
tag: "0.3.32"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/OpenBLAS-0.3.32.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON
}
function Make() {
  # Mirror lcgcmake TARGET selection: HASWELL on RHEL>=9/el9+, ARMV8 on aarch64,
  # NEHALEM elsewhere.  Explicit TARGET avoids OpenBLAS auto-detection surprises.
  case "$(uname -m)" in
    aarch64|arm64) _blas_target=ARMV8 ;;
    x86_64)
      _os_ver=$(. /etc/os-release 2>/dev/null && echo "${VERSION_ID%%.*}" || echo 0)
      [ "${_os_ver}" -ge 9 ] 2>/dev/null && _blas_target=HASWELL || _blas_target=NEHALEM ;;
    *) _blas_target="" ;;
  esac
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS} \
    ${_blas_target:+TARGET=${_blas_target}} BIGNUMA=1 NO_AFFINITY=1
  cmake --build . --target test || true
  unset _blas_target _os_ver
}
