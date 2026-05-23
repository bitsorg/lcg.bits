package: pybdsim
description: pyBDSIM Python interface to BDSIM accelerator simulation
version: "3.6.1"
tag: "3.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################