package: tf_pwa
description: tf-pwa TensorFlow-based partial wave analysis toolkit
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
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################