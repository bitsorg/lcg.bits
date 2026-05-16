package: langchain_text_splitters
description: LangChain text splitting utilities
version: "0.3.5"
tag: "0.3.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langchain_text_splitters-0.3.5.tar.gz
requires:
  - Python
  - pip
  - langchain_core
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