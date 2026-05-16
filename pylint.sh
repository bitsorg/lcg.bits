package: pylint
description: Pylint Python static code analysis tool
version: "4.0.5"
tag: "4.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pylint-4.0.5.tar.gz
requires:
  - Python
  - setuptools
  - astroid
  - isort
  - mccabe
  - tomlkit
  - pip
  - dill
  - platformdirs
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################