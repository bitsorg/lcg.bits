package: parso
description: parso Python parser that supports error recovery
version: "0.8.4"
tag: "0.8.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/parso-0.8.4.tar.gz
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