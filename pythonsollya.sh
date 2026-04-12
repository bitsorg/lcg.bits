package: pythonsollya
description: pythonsollya Python package
version: "0.3"
tag: "0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pythonsollya-release-0.3.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - cython
  - mpfi
  - sollya
  - six
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pythonsollya-0.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################