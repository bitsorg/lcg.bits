package: patsy
description: Patsy mini-language for describing statistical models
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
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################