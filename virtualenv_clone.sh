package: virtualenv_clone
description: virtualenv-clone create a copy of a virtualenv
version: "0.5.4"
tag: "0.5.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/virtualenv-clone-0.5.4.tar.gz
requires:
  - Python
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