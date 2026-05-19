package: httpx
description: HTTPX fully featured async HTTP client for Python
version: "0.28.1"
tag: "0.28.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/httpx-0.28.1.tar.gz
requires:
  - Python
  - certifi
  - httpcore
  - idna
  - sniffio
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################