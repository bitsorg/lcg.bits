package: opt_einsum
description: opt_einsum optimising contraction order for numpy.einsum
version: "3.3.0"
tag: "3.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/opt_einsum-3.3.0.tar.gz
requires:
  - Python
  - setuptools
  - numpy
build_requires:
  - bits-recipe-tools
license: MIT
patches:
  - opt_einsum-3.3.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################