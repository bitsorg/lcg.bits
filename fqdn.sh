package: fqdn
description: fqdn fully-qualified domain name validation for Python
version: "1.5.1"
tag: "1.5.1"
requires:
  - Python
  - arrow
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################