package: tf_pwa
description: tf-pwa TensorFlow-based partial wave analysis toolkit
version: "0.2.2"
tag: "0.2.2"
requires:
  - Python
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################