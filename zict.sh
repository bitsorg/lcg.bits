package: zict
description: zict Python package
version: "3.0.0"
tag: "3.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zict-3.0.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - HeapDict
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