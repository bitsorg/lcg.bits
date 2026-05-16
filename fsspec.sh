package: fsspec
description: fsspec filesystem interfaces for Python
version: "2025.2.0"
tag: "2025.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fsspec-2025.2.0.tar.gz
requires:
  - Python
  - setuptools
  - panel
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################