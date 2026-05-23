package: langchain_community
description: LangChain community integrations
version: "0.3.14"
tag: "0.3.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################