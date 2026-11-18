package: tfs_pandas
description: tfs-pandas read/write MAD-X TFS files as pandas DataFrames
version: "4.0.0"
tag: "4.0.0"
requires:
  - Python
  - pandas
  - numpy
  - pytables
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################