package: astropy_iers_data
description: Astropy IERS data tables for time and coordinate transforms
version: "0.2024.10.21.0.33.21"
tag: "0.2024.10.21.0.33.21"
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