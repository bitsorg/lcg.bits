package: astropy_iers_data
description: Astropy IERS data tables for time and coordinate transforms
version: "0.2026.5.25.1.14.13"
tag: "0.2026.5.25.1.14.13"
requires:
  - Python
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