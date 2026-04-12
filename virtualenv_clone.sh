package: virtualenv_clone
description: virtualenv_clone Python package
version: "0.5.4"
tag: "0.5.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/virtualenv-clone-0.5.4.tar.gz
requires:
  - Python
  - setuptools
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