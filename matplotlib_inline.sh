package: matplotlib_inline
description: matplotlib_inline Python package
version: "0.1.7"
tag: "0.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/matplotlib_inline-0.1.7.tar.gz
requires:
  - Python
  - traitlets
  - setuptools
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