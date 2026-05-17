package: jupyterlab_rise
description: RISE JupyterLab extension for Reveal.js slideshows
version: "0.42.0"
tag: "0.42.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyterlab_rise-0.42.0.tar.gz
requires:
  - Python
  - pip
  - jupyterlab
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