package: tf_pwa
description: tf_pwa Python package
version: "0.2.2"
tag: "0.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tf-pwa-0.2.2.tar.gz
requires:
  - Python
  - pip
  - tensorflow
  - matplotlib
  - PyYAML
  - scipy
  - setuptools_scm
  - sympy
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