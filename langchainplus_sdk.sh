package: langchainplus_sdk
description: langchainplus_sdk Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################