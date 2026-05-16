package: mdurl
description: mdurl URL utilities for markdown-it-py
version: "0.1.2"
tag: "0.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mdurl-0.1.2.tar.gz
requires:
  - Python
  - pip
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