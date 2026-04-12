package: imjoy_utils
description: imjoy_utils Python package
version: "0.1.2"
tag: "0.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/imjoy-utils-0.1.2.tar.gz
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