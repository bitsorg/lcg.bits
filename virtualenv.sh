package: virtualenv
description: virtualenv Python package
version: "20.28.0"
tag: "20.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/virtualenv-20.28.0.tar.gz
requires:
  - Python
  - setuptools
  - appdirs
  - distlib
  - filelock
  - six
  - pip
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