package: asttokens
description: asttokens Python package
version: "2.4.1"
tag: "2.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asttokens-2.4.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
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