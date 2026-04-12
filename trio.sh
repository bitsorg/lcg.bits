package: trio
description: trio Python package
version: "0.28.0"
tag: "0.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/trio-0.28.0.tar.gz
requires:
  - Python
  - pip
  - attrs
  - sniffio
  - sortedcontainers
  - idna
  - outcome
  - exceptiongroup
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