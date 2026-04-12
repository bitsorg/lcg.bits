package: events
description: events Python package
version: "0.5"
tag: "0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/events-0.5.tar.gz
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