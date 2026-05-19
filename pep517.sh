package: pep517
description: pep517 wrappers to call PEP 517 build backends
version: "0.13.1"
tag: "0.13.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pep517-0.13.1.tar.gz
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