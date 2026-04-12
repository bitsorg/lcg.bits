package: openai
description: openai Python package
version: "2.3.0"
tag: "2.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openai-2.3.0.tar.gz
requires:
  - Python
  - pip
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