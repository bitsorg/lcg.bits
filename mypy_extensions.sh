package: mypy_extensions
description: mypy_extensions experimental type system extensions
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mypy_extensions-1.0.0.tar.gz
requires:
  - Python
  - setuptools
  - typing_extensions
  - tomli
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################