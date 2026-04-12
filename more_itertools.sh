package: more_itertools
description: more_itertools Python package
version: "10.6.0"
tag: "10.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/more-itertools-10.6.0.tar.gz
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