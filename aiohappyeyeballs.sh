package: aiohappyeyeballs
description: aiohappyeyeballs Happy Eyeballs async TCP connector
version: "2.4.4"
tag: "2.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiohappyeyeballs-2.4.4.tar.gz
requires:
  - Python
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