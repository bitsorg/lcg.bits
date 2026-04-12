package: multiprocess
description: multiprocess Python package
version: "0.70.16"
tag: "0.70.16"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/multiprocess-0.70.16.tar.gz
requires:
  - Python
  - setuptools
  - dill
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