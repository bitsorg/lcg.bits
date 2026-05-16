package: setuptools_scm
description: setuptools_scm manages Python package versions from SCM tags
version: "8.2.0"
tag: "8.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/setuptools_scm-8.2.0.tar.gz
requires:
  - Python
  - setuptools
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