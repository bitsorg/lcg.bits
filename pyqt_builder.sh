package: pyqt_builder
description: PyQt-builder PEP 517 builder for PyQt packages
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
license: GPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################