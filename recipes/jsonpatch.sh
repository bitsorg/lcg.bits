package: jsonpatch
description: jsonpatch apply JSON Patch operations (RFC 6902)
version: "1.33"
tag: "1.33"
requires:
  - Python
  - jsonpointer
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################