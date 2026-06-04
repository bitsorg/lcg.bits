package: rfc3986_validator
description: rfc3986-validator RFC 3986 URI format validator
version: "0.1.1"
tag: "0.1.1"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################