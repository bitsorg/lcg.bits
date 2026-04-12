package: typing_inspection
description: typing_inspection Python package
version: "0.4.2"
tag: "0.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typing_inspection-0.4.2.tar.gz
requires:
  - Python
  - pip
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