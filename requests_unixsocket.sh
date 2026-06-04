package: requests_unixsocket
description: requests-unixsocket Unix domain socket support for requests
version: "0.2.0"
tag: "0.2.0"
requires:
  - Python
  - requests
  - urllib3
  - pbr
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