package: iso8601
description: iso8601 simple ISO 8601 date/time parser for Python
version: "1.0.2"
tag: "1.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/iso8601-1.0.2.tar.gz
requires:
  - Python
  - setuptools
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