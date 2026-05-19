package: extension_helpers
description: extension-helpers Python build helpers for compiled extensions
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/extension-helpers-1.0.0.tar.gz
requires:
  - Python
  - pip
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