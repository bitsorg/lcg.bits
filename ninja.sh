package: ninja
description: Ninja small build system with a focus on speed
version: "1.13.2"
tag: "1.13.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ninja-1.13.2.tar.gz
requires:
  - Python
  - pip
prefer_system: ".*"
prefer_system_check: |
  type ninja

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################