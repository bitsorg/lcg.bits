package: itk
description: Insight Segmentation and Registration Toolkit
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - pip
  - numpy
  - itk_core
  - itk_numerics
  - itk_io
  - itk_filtering
  - itk_registration
  - itk_segmentation
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################