package: events
description: events.py simple events system for Python
version: "0.5"
tag: "0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/events-0.5.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################