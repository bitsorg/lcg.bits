package: ptyprocess
description: ptyprocess launch a subprocess in a pseudo terminal (pty)
version: "0.7.0"
tag: "0.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ptyprocess-0.7.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################