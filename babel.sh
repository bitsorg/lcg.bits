package: babel
description: Babel internationalisation tools for Python
version: "2.17.0"
tag: "2.17.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Babel-2.17.0.tar.gz
requires:
  - Python
  - setuptools
  - pytz
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################