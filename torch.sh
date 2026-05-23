package: torch
description: PyTorch open-source machine learning framework
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################