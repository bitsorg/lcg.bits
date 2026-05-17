package: flexparser
description: FlexParser flexible typed configuration file parser
version: "0.4"
tag: "0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flexparser-0.4.tar.gz
requires:
  - Python
  - setuptools
  - typing_extensions
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################