package: distro
description: distro OS platform information for Python
version: "1.9.0"
tag: "1.9.0"
requires:
  - Python
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