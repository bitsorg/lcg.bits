package: pathos
description: pathos Python package
version: "0.2.3"
tag: "0.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pathos-0.2.3.tar.gz
requires:
  - Python
  - setuptools
  - six
  - multiprocess
  - pox
  - ppft
  - dill
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