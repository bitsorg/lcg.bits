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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
function PostInstall() {
  # Delphes consumers' vendored FindDelphes.cmake finds the bundled TrackCovariance
  # headers only via $DELPHES_DIR, else "missing DELPHES_EXTERNALS_TKCOV_INCLUDE_DIR".
  # bits exports DELPHES_ROOT not DELPHES_DIR, so publish it via the modulefile.
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv DELPHES_DIR $PKG_ROOT
EOF
}
