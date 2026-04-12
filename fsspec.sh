package: fsspec
description: fsspec Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################