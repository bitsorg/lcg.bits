package: rust
description: Rust systems programming language toolchain
version: "1.94.1"
tag: "1.94.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rust-1.94.1-${RUST_ARCH}-${RUST_OS}.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
# Rust is distributed as a pre-built binary tarball; no compilation needed.
function Configure() {
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .
}
function Make() { true; }
function MakeInstall() {
  mkdir -p "$INSTALLROOT"
  ./install.sh --prefix="$INSTALLROOT" --verbose
}
