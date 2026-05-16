package: ninja
description: Ninja small build system with a focus on speed
version: "1.13.2"
tag: "1.13.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ninja-1.13.2.tar.gz
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################