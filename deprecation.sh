package: deprecation
description: deprecation Python package
version: "2.1.0"
tag: "2.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/deprecation-2.1.0.tar.gz
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