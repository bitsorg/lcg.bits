package: beautifulsoup4
description: Beautiful Soup HTML/XML parsing library for Python
version: "4.10.0"
tag: "4.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/beautifulsoup4-4.10.0.tar.gz
requires:
  - Python
  - setuptools
  - soupsieve
  - pip
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