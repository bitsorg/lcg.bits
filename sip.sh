package: sip
description: sip Python package
version: "6.8.3"
tag: "6.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sip-6.8.3.tar.gz
requires:
  - Python
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