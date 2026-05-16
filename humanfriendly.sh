package: humanfriendly
description: humanfriendly human-friendly output for Python
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
license: MIT
patches:
  - humanfriendly-10.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################