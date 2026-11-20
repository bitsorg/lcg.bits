package: nbclient
description: nbclient client library for executing Jupyter notebooks
version: "0.5.3"
tag: "0.5.3"
requires:
  - Python
  - traitlets
  - jupyter_client
  - nbformat
  - async_generator
  - nest_asyncio
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