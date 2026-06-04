package: plotly
description: Plotly interactive graphing library for Python
version: "5.16.1"
tag: "5.16.1"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################