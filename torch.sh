package: torch
description: torch Python package
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torch-2.11.0.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - PyYAML
  - cffi
  - numpy
  - blas
  - CMake
  - ninja
  - networkx
  - Jinja2
  - sympy
  - filelock
  - typing_extensions
  - fsspec
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################