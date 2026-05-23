package: jupyter_nbextensions_configurator
description: Jupyter server extension to configure nbextensions
version: "0.6.4"
tag: "0.6.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - jupyter_contrib_core
  - PyYAML
  - traitlets
  - tornado
  - notebook
  - jupyter_core
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################