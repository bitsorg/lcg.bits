package: uproot
description: uproot ROOT I/O in pure Python (without CERN ROOT)
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################