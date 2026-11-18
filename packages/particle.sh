package: particle
description: Particle HEP particle data from PDG in Python
version: "0.26.0"
tag: "0.26.0"
requires:
  - Python
  - hatchling
  - attrs
  - hepunits
  - deprecated
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################