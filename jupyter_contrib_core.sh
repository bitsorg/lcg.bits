package: jupyter_contrib_core
description: jupyter_contrib_core utilities for Jupyter contrib extensions
version: "0.4.2"
tag: "0.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - tornado
  - notebook
  - traitlets
  - entrypoints
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