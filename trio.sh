package: trio
description: Trio async concurrency library for Python
version: "0.28.0"
tag: "0.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/trio-0.28.0.tar.gz
requires:
  - Python
  - attrs
  - sniffio
  - sortedcontainers
  - idna
  - outcome
  - exceptiongroup
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################