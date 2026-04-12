package: torchvision
description: torchvision Python package
version: "0.22.1"
tag: "0.22.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torchvision-0.22.1.tar.gz
requires:
  - torch
  - pillow
  - six
  - typing_extensions
  - requests
  - sympy
  - png
  - ninja
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