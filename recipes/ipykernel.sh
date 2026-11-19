package: ipykernel
description: ipykernel IPython kernel for Jupyter
version: "6.29.5"
tag: "6.29.5"
requires:
  - Python
  - debugpy
  - ipython
  - traitlets
  - jupyter_client
  - tornado
  - matplotlib_inline
  # optional:
  # - setuptools
  # - six
  # - appnope
  - comm
  - nest_asyncio
  - psutil
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