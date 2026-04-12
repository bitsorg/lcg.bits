package: astropy_iers_data
description: astropy_iers_data Python package
version: "0.2024.10.21.0.33.21"
tag: "0.2024.10.21.0.33.21"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/astropy_iers_data-0.2024.10.21.0.33.21.tar.gz
requires:
  - Python
  - setuptools
  - pip
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