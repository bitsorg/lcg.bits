package: paramiko
description: paramiko Python package
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