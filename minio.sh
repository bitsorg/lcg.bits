package: minio
description: MinIO Python client SDK for S3-compatible object storage
version: "7.2.15"
tag: "7.2.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/minio-7.2.15.tar.gz
requires:
  - Python
  - certifi
  - python_dateutil
  - six
  - pytz
  - urllib3
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