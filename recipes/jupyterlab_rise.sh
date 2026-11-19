package: jupyterlab_rise
description: RISE JupyterLab extension for Reveal.js slideshows
version: "0.42.0"
tag: "0.42.0"
requires:
  - Python
  - jupyterlab
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################