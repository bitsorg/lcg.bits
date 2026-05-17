package: langchainplus_sdk
description: LangSmith SDK for LangChain tracing and evaluation
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/langchainplus_sdk-unknown.tar.gz
requires:
  - Python
  - pip
  - pydantic
  - requests
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