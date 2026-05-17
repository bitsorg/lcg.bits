package: s3transfer
description: s3transfer Amazon S3 transfer management library
version: "0.10.3"
tag: "0.10.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/s3transfer-0.10.3.tar.gz
requires:
  - Python
  - setuptools
  - botocore
  # optional:
  # - awscrt
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################