package: epos4
description: EPOS4 hadronic interaction and heavy-ion event generator
version: "4.0.3.atlas1"
tag: "4.0.3.atlas1"
sources:
  # Upstream tarball is named for the base version (4.0.3); the ".atlas1" suffix
  # is only the LCG version label, not part of the filename.  In lcgcmake this
  # comes from "author=4.0.3" in the epos4 package declaration, giving
  # epos<author>.tgz = epos4.0.3.tgz.
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
  # macOS: gated off. EPOS4's >4 GB static Fortran COMMON can't be addressed by
  # arm64's code model (no large model in arm64 gfortran), so the final
  # libepos/Xepos link fails (ADRP out of range). Leaf package -> empty package;
  # remove this guard + the Make/MakeInstall/PostInstall ones to resume the port.
  bits_is_macos && { mkdir -p "$INSTALLROOT"; return 0; }
  # The project's CMake doesn't give KW's bas.f EPOS's Fortran flags, so inject
  # them via CMAKE_Fortran_FLAGS (reaches every target) + -fallow-argument-
  # mismatch. -mcmodel=large is x86_64-only (arm64 gfortran lacks it).
  local _fflags="-fallow-argument-mismatch -cpp -std=legacy -fno-automatic"
  [ "$(uname -m)" != arm64 ] && _fflags="$_fflags -mcmodel=large"
  # macOS source fixes (kept ready for when the gate is lifted): <malloc.h> ->
  # <stdlib.h> in the one file that needs it, and drop GNU-ld-only -Wl,--no-relax.
  if bits_is_macos; then
    bits_file_replace "${SOURCEDIR}/src/KWb/time.c" '#include <malloc.h>' '#include <stdlib.h>'
    bits_file_replace "${SOURCEDIR}/CMakeLists.txt" '-Wl,--no-relax' ''
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_Fortran_FLAGS="$_fflags" \
    -DCOMPILE_OPTION=BASIC \
    -DCOMPILE_LIBRARY=ON \
    -DFASTSYS="${FASTJET_ROOT}" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  # macOS: gated off (see Configure).
  bits_is_macos && return 0
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
function MakeInstall() {
  # macOS: gated off (see Configure).
  bits_is_macos && return 0
  cmake --install .
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
