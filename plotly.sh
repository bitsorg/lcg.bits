package: plotly
description: Plotly interactive graphing library for Python
version: "5.16.1"
tag: "5.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/plotly-5.16.1.tar.gz
requires:
  - Python
  - six
  - retrying
  - matplotlib
  - ipywidgets
  - packaging
  - tenacity
  - rust
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################