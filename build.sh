package: build
description: build PEP 517 compliant Python package builder
version: "0.8.0"
tag: "0.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/build-0.8.0.tar.gz
requires:
  - Python
  - setuptools
  - tomli
  - packaging
  - pep517
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