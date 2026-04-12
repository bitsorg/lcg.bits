package: googledrivedownloader
description: googledrivedownloader Python package
version: "0.4"
tag: "0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/googledrivedownloader-0.4.tar.gz
requires:
  - Python
  - setuptools
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