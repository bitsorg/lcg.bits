package: markdown_it_py
description: markdown_it_py Python package
version: "2.2.0"
tag: "2.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/markdown-it-py-2.2.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - mdurl
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