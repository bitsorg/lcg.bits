package: aiohappyeyeballs
description: aiohappyeyeballs Python package
version: "2.4.4"
tag: "2.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiohappyeyeballs-2.4.4.tar.gz
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