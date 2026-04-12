package: cpymad
description: cpymad Python package
version: "1.19.0"
tag: "1.19.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cpymad-1.19.0.tar.gz
requires:
  - Python
  - setuptools
  - cython
  - numpy
  - minrpc
  - madx
  - importlib_resources
  - zipp
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