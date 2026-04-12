package: ipydatawidgets
description: ipydatawidgets Python package
version: "4.3.5"
tag: "4.3.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipydatawidgets-4.3.5.tar.gz
requires:
  - Python
  - setuptools
  - traittypes
  - ipywidgets
  - numpy
  - six
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