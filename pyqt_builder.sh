package: pyqt_builder
description: pyqt_builder Python package
version: "1.18.1"
tag: "1.18.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyQt-builder-1.18.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
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