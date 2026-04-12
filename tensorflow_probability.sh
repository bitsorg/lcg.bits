package: tensorflow_probability
description: tensorflow_probability Python package
version: "0.25.0"
tag: "0.25.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tensorflow-probability-0.25.0.tar.gz
requires:
  - Python
  - setuptools
  - absl_py
  - six
  - numpy
  - decorator
  - cloudpickle
  - gast
  - dm_tree
  - looseversion
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - tensorflow_probability-0.25.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################