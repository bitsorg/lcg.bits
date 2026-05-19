package: ipykernel
description: ipykernel IPython kernel for Jupyter
version: "6.29.5"
tag: "6.29.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipykernel-6.29.5.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################