package: cmw_tracing
description: CMW tracing library (CERN Controls Middleware)
version: "unknown"
tag: "unknown"
requires:
  - pip
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