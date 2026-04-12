package: nbclient
description: nbclient Python package
version: "0.5.3"
tag: "0.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nbclient-0.5.3.tar.gz
requires:
  - Python
  - setuptools
  - traitlets
  - jupyter_client
  - nbformat
  - async_generator
  - nest_asyncio
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################