package: prettytable
description: prettytable Python package
version: "3.0.0"
tag: "3.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/prettytable-3.0.0.tar.gz
requires:
  - Python
  - setuptools
  - wcwidth
  - setuptools_scm
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