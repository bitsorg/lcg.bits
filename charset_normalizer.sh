package: charset_normalizer
description: charset-normalizer alternative to chardet for encoding detection
version: "3.4.0"
tag: "3.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/charset-normalizer-3.4.0.tar.gz
requires:
  - Python
  - setuptools
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