package: imageio
description: imageio library for reading and writing image data
version: "2.37.0"
tag: "2.37.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/imageio-2.37.0.tar.gz
requires:
  - Python
  - setuptools
  - pillow
  - numpy
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################