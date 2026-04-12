package: ipykernel
description: ipykernel Python package
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