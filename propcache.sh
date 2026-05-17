package: propcache
description: propcache fast property caching utilities
version: "0.2.1"
tag: "0.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/propcache-0.2.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################