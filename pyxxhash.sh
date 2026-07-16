package: pyxxhash
description: pyxxhash Python bindings for xxHash
version: "3.5.0"
source: https://github.com/ifduyue/python-xxhash
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xxhash-3.5.0.tar.gz
requires:
  - Python
  - xxHash
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