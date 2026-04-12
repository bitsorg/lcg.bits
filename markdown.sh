package: markdown
description: markdown Python package
version: "3.7"
tag: "3.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Markdown-3.7.tar.gz
requires:
  - Python
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