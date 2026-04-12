package: mako
description: mako Python package
version: "1.3.5"
tag: "1.3.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Mako-1.3.5.tar.gz
requires:
  - Python
  - setuptools
  - MarkupSafe
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