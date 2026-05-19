package: charset_normalizer
description: charset-normalizer alternative to chardet for encoding detection
version: "3.4.0"
tag: "3.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/charset-normalizer-3.4.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################