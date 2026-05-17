package: urllib3
description: urllib3 powerful user-friendly HTTP client for Python
version: "2.6.3"
tag: "2.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/urllib3-2.6.3.tar.gz
requires:
  - Python
  - setuptools
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