package: tfs_pandas
description: tfs-pandas read/write MAD-X TFS files as pandas DataFrames
version: "4.0.0"
tag: "4.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tfs-pandas-4.0.0.tar.gz
requires:
  - Python
  - pandas
  - numpy
  - pip
  - pytables
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################