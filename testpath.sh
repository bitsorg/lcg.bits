package: testpath
description: testpath Python package
version: "0.6.0"
tag: "0.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/testpath-0.6.0.tar.gz
requires:
  - Python
  - setuptools
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