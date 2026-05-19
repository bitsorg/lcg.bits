package: pexpect
description: Pexpect controlling interactive console applications
version: "4.9.0"
tag: "4.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pexpect-4.9.0.tar.gz
requires:
  - Python
  - ptyprocess
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
patches:
  - pexpect-4.9.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################