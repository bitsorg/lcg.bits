package: pillow
description: Pillow the friendly PIL (Python Imaging Library) fork
version: "11.2.1"
tag: "11.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Pillow-11.2.1.tar.gz
requires:
  - Python
  - setuptools
  - freetype
  - zlib
  - libffi
  - cffi
build_requires:
  - bits-recipe-tools
license: HPND
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################