package: botocore
description: botocore Python package
version: "1.35.48"
tag: "1.35.48"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/botocore-1.35.48.tar.gz
requires:
  - Python
  - setuptools
  - jmespath
  - python_dateutil
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