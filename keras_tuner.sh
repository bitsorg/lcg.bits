package: keras_tuner
description: keras_tuner Python package
version: "1.4.7"
tag: "1.4.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/keras_tuner-1.4.7.tar.gz
requires:
  - Python
  - setuptools
  - packaging
  - numpy
  - requests
  - scipy
  - ipython
  - kt_legacy
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