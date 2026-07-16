package: ultralytics_thop
description: ultralytics-thop FLOPs/params counting for neural networks
version: "2.0.14"
source: https://github.com/ultralytics/thop
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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