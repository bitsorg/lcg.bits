package: pyasn1
description: pyasn1 pure-Python ASN.1 library
version: "0.6.1"
tag: "0.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyasn1-0.6.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################