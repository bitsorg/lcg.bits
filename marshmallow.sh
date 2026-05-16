package: marshmallow
description: marshmallow object serialization and deserialization library
version: "3.16.0"
tag: "3.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/marshmallow-3.16.0.tar.gz
requires:
  - Python
  - setuptools
  - packaging
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