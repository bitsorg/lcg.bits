package: jsonpatch
description: jsonpatch Python package
version: "1.33"
tag: "1.33"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jsonpatch-1.33.tar.gz
requires:
  - Python
  - setuptools
  - jsonpointer
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