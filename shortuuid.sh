package: shortuuid
description: shortuuid generate concise, unambiguous UUIDs
version: "1.0.13"
tag: "1.0.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/shortuuid-1.0.13.tar.gz
requires:
  - Python
  - pip
  - #Django
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################