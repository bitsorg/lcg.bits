package: imagesize
description: imagesize gets image size from the file header
version: "1.4.1"
tag: "1.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/imagesize-1.4.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################