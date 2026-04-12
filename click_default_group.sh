package: click_default_group
description: click_default_group Python package
version: "1.2.4"
tag: "1.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/click_default_group-1.2.4.tar.gz
requires:
  - Python
  - pip
  - click
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