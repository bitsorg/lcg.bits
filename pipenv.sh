package: pipenv
description: Pipenv Python virtualenv + pip workflow tool
version: "2024.4.0"
tag: "2024.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pipenv-2024.4.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - certifi
  - setuptools
  - virtualenv
  - virtualenv_clone
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