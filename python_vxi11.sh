package: python_vxi11
description: python-vxi11 VXI-11 instrument control via Python
version: "0.9"
tag: "0.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-vxi11-0.9.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - python_vxi11-0.9.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################