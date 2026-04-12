package: tf_keras
description: tf_keras Python package
version: "2.20.1"
tag: "2.20.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tf_keras-2.20.1.tar.gz
requires:
  - Python
  - pip
  - tensorflow
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