package: bleach
description: Bleach allowed-list-based HTML sanitization library
version: "3.3.1"
tag: "3.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bleach-3.3.1.tar.gz
requires:
  - Python
  - setuptools
  - html5lib
  - six
  - packaging
  - webencodings
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