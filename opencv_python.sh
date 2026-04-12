package: opencv_python
description: opencv_python Python package
version: "4.12.0.88"
tag: "4.12.0.88"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/opencv-python-4.12.0.88.tar.gz
requires:
  - Python
  - pip
  - numpy
  - scikitbuild
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