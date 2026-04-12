package: multidict
description: multidict Python package
version: "6.4.4"
tag: "6.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/multidict-6.4.4.tar.gz
requires:
  - Python
  - setuptools
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