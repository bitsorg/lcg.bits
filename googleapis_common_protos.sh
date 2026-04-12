package: googleapis_common_protos
description: googleapis_common_protos Python package
version: "1.56.4"
tag: "1.56.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/googleapis-common-protos-1.56.4.tar.gz
requires:
  - Python
  - protobuf
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