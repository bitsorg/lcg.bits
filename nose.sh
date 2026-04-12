package: nose
description: nose Python package
version: "1.7.0"
tag: "1.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nose_py3-1.7.0.tar.gz
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