package: ngff_zarr
description: ngff-zarr Next Generation File Format Zarr utilities
version: "0.10.2"
tag: "0.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ngff_zarr-0.10.2.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################