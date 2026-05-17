package: click_didyoumean
description: click-didyoumean 'did you mean?' suggestions for Click
version: "0.3.0"
tag: "0.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/click-didyoumean-0.3.0.tar.gz
requires:
  - Python
  - setuptools
  - click
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