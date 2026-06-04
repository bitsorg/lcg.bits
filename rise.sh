package: rise
description: RISE Jupyter/IPython Slideshow extension
version: "5.7.1"
tag: "5.7.1"
requires:
  - Python
  - notebook
  - jupyter_core
  - traitlets
  - decorator
  - tornado
  - beautifulsoup4
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
