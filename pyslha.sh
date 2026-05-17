package: pyslha
description: pyslha Python reader/writer for SUSY Les Houches Accord files
version: "3.2.6"
tag: "3.2.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyslha-3.2.6.tar.gz
requires:
  - Python
  - setuptools
  - tex2pix
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################