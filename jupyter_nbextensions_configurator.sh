package: jupyter_nbextensions_configurator
description: Jupyter server extension to configure nbextensions
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_nbextensions_configurator-unknown.tar.gz
requires:
  - jupyter_contrib_core
  - PyYAML
  - traitlets
  - tornado
  - notebook
  - jupyter_core
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