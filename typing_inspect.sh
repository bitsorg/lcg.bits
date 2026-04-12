package: typing_inspect
description: typing_inspect Python package
version: "0.9.0"
tag: "0.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typing_inspect-0.9.0.tar.gz
requires:
  - Python
  - pip
  - mypy_extensions
  - typing_extensions
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