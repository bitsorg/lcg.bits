package: paramiko
description: Paramiko SSHv2 protocol library for Python
version: "3.4.0"
tag: "3.4.0"
requires:
  - Python
  - cryptography
  - bcrypt
  - pynacl
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################