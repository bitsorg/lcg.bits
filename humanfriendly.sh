package: humanfriendly
description: humanfriendly Python package
version: "10.0"
tag: "10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/humanfriendly-10.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - docutils
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - humanfriendly-10.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################