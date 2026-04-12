package: sentencepiece
description: sentencepiece Python package
version: "0.2.0"
tag: "0.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sentencepiece-0.2.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - sentencepiece-0.2.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################