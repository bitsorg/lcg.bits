package: nbformat
description: nbformat Jupyter notebook file format reference implementation
version: "5.9.1"
tag: "5.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nbformat-5.9.1.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - traitlets
  - ipython_genutils
  - jupyter_core
  - jsonschema
  - fastjsonschema
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################