package: boto3
description: Boto3 AWS SDK for Python
version: "1.35.48"
tag: "1.35.48"
requires:
  - Python
  - botocore
  - jmespath
  - s3transfer
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