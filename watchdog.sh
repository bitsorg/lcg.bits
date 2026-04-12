package: watchdog
description: watchdog Python package
version: "2.1.7"
tag: "2.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/watchdog-2.1.7.tar.gz
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