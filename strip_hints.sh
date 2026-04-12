package: strip_hints
description: strip_hints Python package
version: "0.1.13"
tag: "0.1.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/strip-hints-0.1.13.tar.gz
requires:
  - Python
  - six
  - wheel
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