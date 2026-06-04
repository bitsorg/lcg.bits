package: s3transfer
description: s3transfer Amazon S3 transfer management library
version: "0.10.3"
tag: "0.10.3"
requires:
  - Python
  - botocore
  # optional:
  # - awscrt
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################