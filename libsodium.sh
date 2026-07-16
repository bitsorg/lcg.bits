package: libsodium
description: libsodium modern cryptography library (NaCl fork)
version: "1.0.21"
source: https://github.com/jedisct1/libsodium
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
