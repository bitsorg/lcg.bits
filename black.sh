package: black
description: black Python package
version: "24.10.0"
tag: "24.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/black-24.10.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - click
  - mypy_extensions
  - packaging
  - pathspec
  - platformdirs
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