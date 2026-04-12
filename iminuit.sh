package: iminuit
description: iminuit Python package
version: "2.32.0"
tag: "2.32.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/iminuit-2.32.0.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - ipython
  - matplotlib
  - cython
  - pytest
  - pylint
  - ipywidgets
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