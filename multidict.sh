package: multidict
description: multidict key-values pairs where key may have several values
version: "6.4.4"
tag: "6.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/multidict-6.4.4.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################