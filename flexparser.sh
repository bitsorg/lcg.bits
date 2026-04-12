package: flexparser
description: flexparser Python package
version: "0.4"
tag: "0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flexparser-0.4.tar.gz
requires:
  - Python
  - setuptools
  - typing_extensions
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