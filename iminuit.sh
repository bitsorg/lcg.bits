package: iminuit
description: iminuit Minuit2 minimizer Python interface
version: "2.32.0"
tag: "2.32.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################