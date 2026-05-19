package: pydantic
description: Pydantic data validation using Python type annotations
version: "2.12.5"
tag: "2.12.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pydantic-2.12.5.tar.gz
requires:
  - Python
  - cython
  - typing_extensions
  - mypy
  - hypothesis
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