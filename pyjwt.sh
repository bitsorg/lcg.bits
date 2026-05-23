package: PyJWT
description: PyJWT JSON Web Token implementation for Python
version: "2.8.0"
tag: "2.8.0"
sources:
  - https://files.pythonhosted.org/packages/source/P/PyJWT/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################