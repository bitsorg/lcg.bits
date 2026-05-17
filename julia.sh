package: julia
description: Julia high-performance dynamic programming language
version: "1.11.6"
tag: "1.11.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/julia-1.11.6-linux-x86_64.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
