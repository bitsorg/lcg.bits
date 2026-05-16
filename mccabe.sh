package: mccabe
description: mccabe McCabe complexity checker for Python
version: "0.7.0"
tag: "0.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mccabe-0.7.0.tar.gz
requires:
  - Python
  - setuptools
  - pytest_runner
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################