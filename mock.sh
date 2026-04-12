package: mock
description: mock Python package
version: "3.0.5"
tag: "3.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mock-3.0.5.tar.gz
requires:
  - Python
  - setuptools
  - six
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