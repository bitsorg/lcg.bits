package: rust
description: Rust systems programming language toolchain
version: "1.94.1"
tag: "1.94.1"
sources:
  - "((?!osx).*x86-64.*)https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s-x86_64-unknown-linux-gnu.tar.gz"
  - "((?!osx).*aarch64.*)https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s-aarch64-unknown-linux-gnu.tar.gz"
  - "(osx.*x86-64.*)https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s-x86_64-apple-darwin.tar.gz"
  - "(osx.*aarch64.*)https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s-aarch64-apple-darwin.tar.gz"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
# Rust is distributed as a pre-built binary tarball; install via the bundled script.
function MakeInstall() {
  mkdir -p "$INSTALLROOT"
  ./install.sh --prefix="$INSTALLROOT" --verbose
}
