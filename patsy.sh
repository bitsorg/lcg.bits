package: patsy
description: patsy Python package
version: "0.5.6"
tag: "0.5.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/patsy-0.5.6.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - pandas
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