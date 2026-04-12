package: jupyter_core
description: jupyter_core Python package
version: "5.7.2"
tag: "5.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_core-5.7.2.tar.gz
requires:
  - Python
  - setuptools
  - traitlets
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