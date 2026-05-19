package: ultralytics_thop
description: ultralytics-thop FLOPs/params counting for neural networks
version: "2.0.14"
tag: "2.0.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ultralytics_thop-2.0.14.tar.gz
requires:
  - Python
  - wheel
  - numpy
  - torch
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - ultralytics_thop-2.0.14.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################