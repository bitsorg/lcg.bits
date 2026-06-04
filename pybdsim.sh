package: pybdsim
description: pyBDSIM Python interface to BDSIM accelerator simulation
version: "3.6.1"
tag: "3.6.1"
requires:
  - Python
  - numpy
  - scipy
  - Jinja2
  - pymadx
  - pytransport
  # optional:
  # - uproot
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################