package: CouchDB
description: CouchDB Python client library
version: "1.2"
tag: "1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/CouchDB-1.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - CouchDB-1.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################