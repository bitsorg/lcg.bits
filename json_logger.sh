package: json_logger
description: json_logger Python package
version: "2.0.7"
tag: "2.0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-json-logger-2.0.7.tar.gz
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