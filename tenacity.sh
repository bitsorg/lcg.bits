package: tenacity
description: tenacity Python package
version: "9.0.0"
tag: "9.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tenacity-9.0.0.tar.gz
requires:
  - Python
  - setuptools
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