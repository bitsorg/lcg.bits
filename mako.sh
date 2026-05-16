package: mako
description: Mako fast Python template library
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################