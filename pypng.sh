package: pypng
description: PyPNG pure Python PNG image read/write library
version: "0.20220715.0"
source: https://github.com/drj11/pypng
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - pypng-0.20220715.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################