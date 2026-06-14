package: delphes
description: Delphes fast detector response simulation framework
version: "3.5.1pre14"
tag: "3.5.1pre14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  # optional:
  # - pythia8
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
function PostInstall() {
  # Consumers' vendored FindDelphes.cmake finds the bundled TrackCovariance
  # headers (TrkUtil.h) only via $DELPHES_DIR (one dir deeper than its suffix
  # search). bits exports DELPHES_ROOT, not DELPHES_DIR, so publish it here.
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv DELPHES_DIR $PKG_ROOT
EOF
}
