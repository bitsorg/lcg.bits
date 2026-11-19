package: brotli
description: Brotli lossless data compression algorithm and Python bindings
version: "1.0.8"
source: https://github.com/google/brotli
tag: "v%(version)s"
# bits upgrade: no tarball of 1.0.8, built from the git tag
# sources:
#   - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - cpe:2.3:a:google:brotli:%(version)s
# patches:
#   - brotli-1.0.7.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
