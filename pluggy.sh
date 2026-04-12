package: pluggy
description: pluggy Python package
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pluggy-1.5.0.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - importlib_metadata
  - zipp
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