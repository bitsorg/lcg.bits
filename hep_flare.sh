package: hep_flare
description: hep-flare Dask-aware columnar HEP analysis tools
version: "0.2.2"
tag: "0.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hep_flare-0.2.2.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - b2luigi
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