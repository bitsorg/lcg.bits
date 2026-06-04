package: opencv_python
description: opencv-python pre-built OpenCV Python packages
version: "4.12.0.88"
tag: "4.12.0.88"
requires:
  - Python
  - numpy
  - scikitbuild
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