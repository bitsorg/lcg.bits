package: semantic_version
description: semantic_version semantic versioning for Python
version: "2.10.0"
tag: "2.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/semantic_version-2.10.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################