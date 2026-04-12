package: uproot
description: uproot Python package
version: "5.7.1"
tag: "5.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uproot-5.7.1.tar.gz
requires:
  - pip
  - numpy
  - awkward
  - xrootd
  - fsspec
  - typing_extensions
  - cramjam
  - pyxxhash
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