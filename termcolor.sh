package: termcolor
description: termcolor Python package
version: "2.4.0"
tag: "2.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/termcolor-2.4.0.tar.gz
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