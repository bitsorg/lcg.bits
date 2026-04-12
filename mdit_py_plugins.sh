package: mdit_py_plugins
description: mdit_py_plugins Python package
version: "0.4.0"
tag: "0.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mdit_py_plugins-0.4.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - markdown_it_py
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