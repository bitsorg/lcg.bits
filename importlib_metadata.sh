package: importlib_metadata
description: importlib_metadata backport of importlib.metadata
version: "9.0.0"
tag: "9.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/importlib_metadata-9.0.0.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - six
  - zipp
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################