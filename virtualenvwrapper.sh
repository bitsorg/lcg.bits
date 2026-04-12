package: virtualenvwrapper
description: virtualenvwrapper Python package
version: "4.8.4"
tag: "4.8.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/virtualenvwrapper-4.8.4.tar.gz
requires:
  - Python
  - setuptools
  - virtualenv
  - virtualenv_clone
  - stevedore
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