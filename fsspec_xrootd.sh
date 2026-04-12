package: fsspec_xrootd
description: fsspec_xrootd Python package
version: "0.5.1"
tag: "0.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fsspec_xrootd-0.5.1.tar.gz
requires:
  - Python
  - fsspec
  - xrootd
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