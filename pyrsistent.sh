package: pyrsistent
description: pyrsistent Python package
version: "0.18.0"
tag: "0.18.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyrsistent-0.18.0.tar.gz
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