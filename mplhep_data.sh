package: mplhep_data
description: mplhep_data Python package
version: "0.0.4"
tag: "0.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mplhep_data-0.0.4.tar.gz
requires:
  - Python
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