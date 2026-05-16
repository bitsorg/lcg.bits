package: shellescape
description: shellescape shell-escape strings for Python
version: "3.8.1"
tag: "3.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/shellescape-3.8.1.tar.gz
requires:
  - Python
  - pip
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