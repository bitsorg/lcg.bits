package: absl_py
description: absl_py Python package
version: "1.4.0"
tag: "1.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/absl-py-1.4.0.tar.gz
requires:
  - Python
  - setuptools
  - six
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