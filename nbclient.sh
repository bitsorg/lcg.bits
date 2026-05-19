package: nbclient
description: nbclient client library for executing Jupyter notebooks
version: "0.5.3"
tag: "0.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nbclient-0.5.3.tar.gz
requires:
  - Python
  - traitlets
  - jupyter_client
  - nbformat
  - async_generator
  - nest_asyncio
  - pip
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