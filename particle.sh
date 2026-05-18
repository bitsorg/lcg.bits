package: particle
description: Particle HEP particle data from PDG in Python
version: "0.26.0"
tag: "0.26.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/particle-0.26.0.tar.gz
requires:
  - Python
  - hatchling
  - attrs
  - hepunits
  - pip
  - deprecated
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################