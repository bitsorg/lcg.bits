package: requests_toolbelt
description: requests-toolbelt utility belt for the requests library
version: "1.0.0"
tag: "1.0.0"
requires:
  - Python
  - six
  - requests
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################