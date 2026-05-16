package: click
description: Click composable command line interface toolkit for Python
version: "8.3.1"
tag: "8.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/click-8.3.1.tar.gz
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