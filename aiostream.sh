package: aiostream
description: aiostream async generator pipelines for Python
version: "0.4.5"
tag: "0.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/aiostream-0.4.5.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
license: GPLv3
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################