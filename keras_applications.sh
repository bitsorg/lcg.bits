package: keras_applications
description: keras_applications Python package
version: "1.0.8"
tag: "1.0.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Keras_Applications-1.0.8.tar.gz
requires:
  - Python
  - setuptools
  - keras
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