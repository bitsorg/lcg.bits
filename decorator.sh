package: decorator
description: decorator Python library to simplify function decorator usage
version: "5.2.1"
tag: "5.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/decorator-5.2.1.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################