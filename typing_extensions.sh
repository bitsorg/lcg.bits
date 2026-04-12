package: typing_extensions
description: typing_extensions Python package
version: "4.15.0"
tag: "4.15.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typing_extensions-4.15.0.tar.gz
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