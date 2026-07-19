package: GarfieldCPP
description: Garfield++ toolkit for detailed simulation of gaseous particle detectors
version: "78fe1bd3"
source: https://gitlab.cern.ch/garfield/garfieldpp
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/garfieldpp-%(version)s.tar.gz
requires:
  - ROOT
  - Geant4
  - GSL
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  local _gsl=()
  local _extra=()
  if bits_is_macos; then
    # macOS: force the GSL path in NeBem; libc++ lacks the C++17 special math functions std::comp_ellint_*
    _gsl+=(-DGARFIELD_WITH_GSL=ON)
    # macOS: pre-include <stdlib.h> so NeBem sources calling exit() compile (libc++ doesn't pull it in like libstdc++)
    _gsl+=(-DCMAKE_CXX_FLAGS="-include stdlib.h")
  elif [ -n "${GCC_TOOLCHAIN_ROOT:-}" ]; then
    # Linux: Garfield's Tests/ link full executables against ROOT, which was built
    # with the GCC-Toolchain (GCC 14). Put the toolchain's libstdc++ on the link
    # line so ld resolves the newer GLIBCXX_3.4.3x / CXXABI_1.3.15 symbols instead
    # of falling back to the older EL9 system libstdc++ (undefined-reference link
    # failure). lib64 first, then lib, for either multilib layout.
    _extra+=(-DCMAKE_EXE_LINKER_FLAGS="-L${GCC_TOOLCHAIN_ROOT}/lib64 -L${GCC_TOOLCHAIN_ROOT}/lib")
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DGARFIELD_WITH_EXAMPLES=OFF \
      -DBUILD_TESTING=OFF \
      -DGARFIELD_WITH_CUDA=OFF \
      ${ROOT_ROOT:+-DROOT_DIR="${ROOT_ROOT}/cmake"} \
      ${GEANT4_ROOT:+-DGeant4_DIR="${GEANT4_ROOT}/lib/Geant4-${GEANT4_VERSION}"} \
      ${GSL_ROOT:+-DGSL_ROOT_DIR="${GSL_ROOT}"} \
      "${_gsl[@]}" "${_extra[@]}"
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv GARFIELD_ROOT $PKG_ROOT
EOF
}
