package: xenv
description: xenv CERN LCG environment setup tool
version: "1.0.1"
tag: "1.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xenv-1.0.1.tar.gz
requires:
  - Python
  - setuptools_scm
  - nose
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################