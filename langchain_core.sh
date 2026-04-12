package: langchain_core
description: langchain_core Python package
version: "0.3.29"
tag: "0.3.29"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langchain_core-0.3.29.tar.gz
requires:
  - Python
  - pip
  - langsmith
  - packaging
  - anyio
  - jsonpatch
  - PyYAML
  - tenacity
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