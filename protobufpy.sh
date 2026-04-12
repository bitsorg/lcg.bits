package: protobufpy
description: protobufpy library/tool (from LCG software stack)
version: "5.28.3"
tag: "5.28.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-5.28.3.tar.gz
requires:
  - pip
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