package: boto3
description: boto3 Python package
version: "1.35.48"
tag: "1.35.48"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boto3-1.35.48.tar.gz
requires:
  - Python
  - setuptools
  - botocore
  - jmespath
  - s3transfer
  # optional:
  # - awscrt
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