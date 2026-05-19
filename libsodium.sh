package: libsodium
description: libsodium modern cryptography library (NaCl fork)
version: "1.0.21"
tag: "1.0.21"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libsodium-1.0.21.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
patches:
  - libsodium-1.0.21.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
