package: memray
description: memray Python package
version: "1.19.2"
tag: "1.19.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/memray-1.19.2.tar.gz
requires:
  - Python
  - pip
  - libunwind
  - lz4
  - Jinja2
  - rich
  - textual
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