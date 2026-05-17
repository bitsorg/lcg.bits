package: tifffile
description: tifffile read/write TIFF files using numpy arrays
version: "2023.4.12"
tag: "2023.4.12"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tifffile-2023.4.12.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - numpy
  - numcodecs
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