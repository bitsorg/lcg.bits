package: mplhep
description: mplhep Matplotlib style sheets and helpers for HEP publications
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mplhep-1.0.0.tar.gz
requires:
  - Python
  - setuptools
  - uhi
  - numpy
  - mplhep_data
  - matplotlib
  - packaging
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################