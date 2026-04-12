package: tensorflow_estimator
description: tensorflow_estimator Python package
version: "unknown"
tag: "unknown"
requires:
  - absl_py
  - six
  - mock
  - numpy
  - wheel
  - Python
  - setuptools
  - funcsigs
  - pip
  - termcolor
  - astor
  - gast
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