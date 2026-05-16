package: toml
description: toml Python TOML file parser and encoder
version: "0.10.2"
tag: "0.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/toml-0.10.2.tar.gz
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