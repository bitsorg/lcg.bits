package: pexpect
description: pexpect Python package
version: "4.9.0"
tag: "4.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pexpect-4.9.0.tar.gz
requires:
  - Python
  - setuptools
  - ptyprocess
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pexpect-4.9.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################