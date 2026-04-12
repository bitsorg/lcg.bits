package: crashtest
description: crashtest Python package
version: "0.3.1"
tag: "0.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/crashtest-0.3.1.tar.gz
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