package: lightning_utilities
description: lightning-utilities common utility functions for PyTorch Lightning
version: "0.12.0"
tag: "0.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lightning-utilities-0.12.0.tar.gz
requires:
  - setuptools
  - packaging
  - typing_extensions
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - lightning_utilities-0.12.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################