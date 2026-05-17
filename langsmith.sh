package: langsmith
description: LangSmith platform client for LLM observability
version: "0.2.10"
tag: "0.2.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langsmith-0.2.10.tar.gz
requires:
  - Python
  - pip
  - pydantic
  - requests
  - orjson
  - httpx
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