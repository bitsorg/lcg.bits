package: python_vxi11
description: python-vxi11 VXI-11 instrument control via Python
version: "0.9"
source: https://github.com/python-ivi/python-vxi11
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-vxi11-0.9.tar.gz
requires:
  - Python
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