package: et_xmlfile
description: et_xmlfile Python package
version: "1.1.0"
tag: "1.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/et_xmlfile-1.1.0.tar.gz
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