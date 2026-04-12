package: matplotlib
description: matplotlib Python package
version: "3.10.8"
tag: "3.10.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/matplotlib-3.10.8.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - numpy
  - nose
  - pyparsing
  - pytz
  - mock
  - kiwisolver
  - pycairo
  - pillow
  - freetype
  - contourpy
  - fonttools
  - importlib_resources
  - packaging
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