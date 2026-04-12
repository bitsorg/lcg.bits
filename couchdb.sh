package: CouchDB
description: CouchDB Python package
version: "1.2"
tag: "1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/CouchDB-1.2.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - CouchDB-1.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################