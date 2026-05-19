package: versioneer
description: versioneer version management from VCS for Python packages
version: "0.29"
tag: "0.29"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/versioneer-0.29.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Unlicense
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################