package: charset_normalizer
description: charset_normalizer Python package
version: "3.4.0"
tag: "3.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/charset-normalizer-3.4.0.tar.gz
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