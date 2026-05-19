package: rise
description: RISE Jupyter/IPython Slideshow extension
version: "5.7.2.2"
tag: "5.7.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rise-5.7.2.2.tar.gz
requires:
  - Python
  - notebook
  - jupyter_core
  - traitlets
  - decorator
  - tornado
  - beautifulsoup4
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