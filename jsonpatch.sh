package: jsonpatch
description: jsonpatch apply JSON Patch operations (RFC 6902)
version: "1.33"
tag: "1.33"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jsonpatch-1.33.tar.gz
requires:
  - Python
  - setuptools
  - jsonpointer
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