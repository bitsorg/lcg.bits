package: keras_preprocessing
description: keras_preprocessing Python package
version: "1.1.2"
tag: "1.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Keras_Preprocessing-1.1.2.tar.gz
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