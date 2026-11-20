package: metakernel
description: MetaKernel base Jupyter kernel with common functionality
version: "0.30.2"
tag: "0.30.2"
requires:
  - Python
  - ipython
  - pexpect
  - ipykernel
  - ipyparallel
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################