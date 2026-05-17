package: sip
description: SIP tool for creating Python bindings for C/C++ libraries
version: "6.8.3"
tag: "6.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sip-6.8.3.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only OR LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################