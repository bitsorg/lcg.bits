package: pyproject_metadata
description: pyproject_metadata - metadata reader/writer for Python's pyproject.toml
version: "0.9.1"
tag: "0.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyproject_metadata-0.9.1.tar.gz
requires:
  - Python
  - pip
  - setuptools
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
