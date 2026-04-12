package: simplejson
description: simplejson Python package
version: "3.16.1"
tag: "3.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/simplejson-3.16.1.tar.gz
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