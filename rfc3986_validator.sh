package: rfc3986_validator
description: rfc3986_validator Python package
version: "0.1.1"
tag: "0.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rfc3986_validator-0.1.1.tar.gz
requires:
  - Python
  - pip
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