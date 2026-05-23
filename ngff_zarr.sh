package: ngff_zarr
description: ngff-zarr Next Generation File Format Zarr utilities
version: "0.10.2"
tag: "0.10.2"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################