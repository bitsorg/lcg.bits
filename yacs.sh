package: yacs
description: YACS Yet Another Configuration System for Python
version: "0.1.8"
tag: "0.1.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/yacs-0.1.8.tar.gz
requires:
  - Python
  - setuptools
  - PyYAML
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