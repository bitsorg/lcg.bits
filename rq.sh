package: rq
description: RQ simple Python job queue backed by Redis
version: "1.10.1"
tag: "1.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rq-1.10.1.tar.gz
requires:
  - Python
  - redis
  - click
  - pip
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