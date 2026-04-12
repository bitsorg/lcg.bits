package: cmw_tracing
description: cmw_tracing Python package
version: "unknown"
tag: "unknown"
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