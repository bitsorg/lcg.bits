package: lightning_utilities
description: lightning_utilities Python package
version: "0.12.0"
tag: "0.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lightning-utilities-0.12.0.tar.gz
requires:
  - setuptools
  - packaging
  - typing_extensions
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - lightning_utilities-0.12.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################