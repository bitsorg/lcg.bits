package: rich
description: rich Python package
version: "13.9.4"
tag: "13.9.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rich-13.9.4.tar.gz
requires:
  - Python
  - setuptools
  - commonmark
  - pygments
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