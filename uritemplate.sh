package: uritemplate
description: uritemplate URI template parsing and expansion library
version: "3.0.1"
tag: "3.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uritemplate-3.0.1.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################