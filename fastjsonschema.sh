package: fastjsonschema
description: fastjsonschema fast JSON Schema validator for Python
version: "2.17.1"
tag: "2.17.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fastjsonschema-2.17.1.tar.gz
requires:
  - Python
  - pip
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################