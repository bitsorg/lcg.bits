package: luigi
description: Luigi workflow management system for data pipelines
version: "3.6.0"
tag: "3.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/luigi-3.6.0.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - tornado
  - tenacity
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################