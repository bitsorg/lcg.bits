package: tzlocal
description: tzlocal detect local timezone for Python
version: "2.0.0"
tag: "2.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tzlocal-2.0.0.tar.gz
requires:
  - Python
  - setuptools
  - pytz
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################