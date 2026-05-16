package: crypto
description: PyCrypto/pycryptodome legacy cryptographic modules
version: "1.4.1"
tag: "1.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/crypto-1.4.1.tar.gz
requires:
  - Python
  - pip
  - naked
  - shellescape
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################