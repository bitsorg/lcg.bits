package: jupyter_core
description: jupyter_core base package for Jupyter projects
version: "5.7.2"
tag: "5.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_core-5.7.2.tar.gz
requires:
  - Python
  - setuptools
  - traitlets
  - pip
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