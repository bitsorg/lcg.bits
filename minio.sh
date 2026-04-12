package: minio
description: minio Python package
version: "7.2.15"
tag: "7.2.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/minio-7.2.15.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - certifi
  - python_dateutil
  - six
  - pytz
  - urllib3
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