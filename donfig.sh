package: donfig
description: Donfig easy configuration for Python packages
version: "0.8.1.post1"
tag: "0.8.1.post1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/donfig-0.8.1.post1.tar.gz
requires:
  - Python
  - pip
  - PyYAML
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