package: zipp
description: zipp backport of zipfile.Path from Python 3.8+
version: "3.20.2"
tag: "3.20.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zipp-3.20.2.tar.gz
requires:
  - Python
  - pip
  - toml
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