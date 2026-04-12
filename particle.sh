package: particle
description: particle Python package
version: "0.26.0"
tag: "0.26.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/particle-0.26.0.tar.gz
requires:
  - Python
  - setuptools
  - attrs
  - hepunits
  - pip
  - deprecated
  - typing_extensions
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