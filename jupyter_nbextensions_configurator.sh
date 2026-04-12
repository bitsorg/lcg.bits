package: jupyter_nbextensions_configurator
description: jupyter_nbextensions_configurator Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################