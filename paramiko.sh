package: paramiko
description: Paramiko SSHv2 protocol library for Python
version: "2.9.2"
tag: "2.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/paramiko-2.9.2.tar.gz
requires:
  - Python
  - setuptools
  - cryptography
  - bcrypt
  - pyasn1
  - pynacl
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################