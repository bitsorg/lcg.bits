package: epos4
description: EPOS4 hadronic interaction and heavy-ion event generator
version: "4.0.3.atlas1"
tag: "4.0.3.atlas1"
sources:
  # Upstream tarball is named for the base version (4.0.3); the ".atlas1" suffix is
  # only the LCG version label, not part of the filename (lcgcmake author=4.0.3,
  # giving epos4.0.3.tgz).
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/epos4.0.3.tgz
requires:
  - CMake
  - ROOT
  - fastjet
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-EPOS4
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
patches:
  - epos4-4.0.3.atlas1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: gated off. EPOS4's >4 GB static Fortran COMMON exceeds arm64's code
  # model (no large model in arm64 gfortran), so the libepos/Xepos link fails.
  # Leaf pkg -> empty pkg; drop this + the Make/MakeInstall/PostInstall gates to port.
  bits_is_macos && { mkdir -p "$INSTALLROOT"; return 0; }
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCOMPILE_OPTION=BASIC \
    -DCOMPILE_LIBRARY=ON \
    -DFASTSYS="${FASTJET_ROOT}" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  # macOS: gated off (see Configure).
  bits_is_macos && return 0
  cmake --build "$BITS_CMAKE_BUILD" -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
function MakeInstall() {
  # macOS: gated off (see Configure).
  bits_is_macos && return 0
  cmake --install "$BITS_CMAKE_BUILD"
}
function PostInstall() {
  # macOS: gated off (see Configure) - no build artefacts or runtime env to set.
  bits_is_macos && return 0
  # Copy data files (excluding source and build artefacts)
  rsync -a \
    --exclude='**/CMakeModules' \
    --exclude=CMakeLists.txt \
    --exclude='**/.git' \
    --exclude='*.h' \
    --exclude='*.c' \
    --exclude='*.cpp' \
    --exclude='*.f' \
    "$SOURCEDIR"/ "$INSTALLROOT"/
  # Extend modulefile with EPOS4 runtime environment
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv EPOS4_ROOT $PKG_ROOT
setenv EPO4VSN 4.0.3
# Final slash is required by EPOS, please leave it be
setenv EPO4 $PKG_ROOT/
prepend-path PATH $::env(EPO4)bin
setenv OPT ./
setenv HTO ./
setenv CHK ./
EOF
}
