package: nbformat
description: nbformat Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################