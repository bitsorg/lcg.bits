package: pyviz_comms
description: pyviz_comms Jupyter communication framework for HoloViews
version: "2.0.1"
tag: "2.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyviz_comms-2.0.1.tar.gz
requires:
  - Python
  - setuptools
  - param
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################