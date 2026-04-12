package: pure_eval
description: pure_eval Python package
version: "0.2.3"
tag: "0.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pure_eval-0.2.3.tar.gz
requires:
  - Python
  - pip
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