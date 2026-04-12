package: astunparse
description: astunparse Python package
version: "1.6.3"
tag: "1.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/astunparse-1.6.3.tar.gz
requires:
  - Python
  - setuptools
  - six
  - wheel
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