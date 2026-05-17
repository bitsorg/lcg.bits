package: jupyter_contrib_core
description: jupyter_contrib_core utilities for Jupyter contrib extensions
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