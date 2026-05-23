package: qibo
description: Qibo open-source quantum computing framework
version: "0.2.23"
tag: "0.2.23"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cma
  - joblib
  - networkx
  - numpy
  - openqasm3
  - scipy
  - sympy
  - tabulate
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - qibo-0.2.23.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################