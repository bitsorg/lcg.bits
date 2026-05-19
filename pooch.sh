package: pooch
description: Pooch manage downloading and caching data files
version: "1.6.0"
tag: "1.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pooch-1.6.0.tar.gz
requires:
  - Python
  - setuptools_scm
  - pip
  - appdirs
  - packaging
  - requests
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