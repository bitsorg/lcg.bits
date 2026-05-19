package: pynacl
description: PyNaCl Python binding to libsodium (NaCl)
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyNaCl-1.5.0.tar.gz
requires:
  - Python
  - six
  - cffi
  - pycparser
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