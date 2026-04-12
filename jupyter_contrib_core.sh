package: jupyter_contrib_core
description: jupyter_contrib_core Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_contrib_core-unknown.tar.gz
requires:
  - setuptools
  - tornado
  - notebook
  - traitlets
  - entrypoints
  - jupyter_core
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