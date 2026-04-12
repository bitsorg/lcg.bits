package: decorator
description: decorator Python package
version: "5.2.1"
tag: "5.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/decorator-5.2.1.tar.gz
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