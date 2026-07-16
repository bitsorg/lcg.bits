package: caio
description: caio async I/O file operations for Linux
version: "0.9.25"
source: https://github.com/mosquito/caio
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - caio-0.9.25.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################