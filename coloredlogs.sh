package: coloredlogs
description: coloredlogs colored terminal log output for Python's logging
version: "15.0.1"
tag: "15.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/coloredlogs-15.0.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - humanfriendly
  - capturer
  - verboselogs
build_requires:
  - bits-recipe-tools
license: MIT
patches:
  - coloredlogs-15.0.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################