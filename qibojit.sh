package: qibojit
description: qibojit Python package
version: "0.1.12"
tag: "0.1.12"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qibojit-0.1.12.tar.gz
requires:
  - Python
  - pip
  - numba
  - psutil
  - qibo
  - scipy
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - qibojit-0.1.12.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################