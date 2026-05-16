package: calmjs_parse
description: calmjs.parse ECMAScript parser for Python
version: "1.3.1"
tag: "1.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/calmjs.parse-1.3.1.zip
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
patches:
  - calmjs_parse-1.3.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################