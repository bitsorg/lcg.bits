package: langchain_community
description: LangChain community integrations
version: "0.3.14"
tag: "0.3.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langchain_community-0.3.14.tar.gz
requires:
  - Python
  - pip
  - langsmith
  - aiohttp
  - dataclasses_json
  - langchain
  - langchain_core
  - numpy
  - PyYAML
  - sqlalchemy
  - tenacity
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