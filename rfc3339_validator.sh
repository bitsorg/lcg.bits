package: rfc3339_validator
description: rfc3339-validator RFC 3339 date-time format validator
version: "0.1.4"
tag: "0.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rfc3339_validator-0.1.4.tar.gz
requires:
  - Python
  - pip
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