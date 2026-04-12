package: httpx
description: httpx Python package
version: "0.28.1"
tag: "0.28.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/httpx-0.28.1.tar.gz
requires:
  - Python
  - pip
  - certifi
  - httpcore
  - idna
  - sniffio
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