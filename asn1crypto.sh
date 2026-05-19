package: asn1crypto
description: asn1crypto fast Python ASN.1 parser and serializer
version: "1.5.1"
tag: "1.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asn1crypto-1.5.1.tar.gz
requires:
  - Python
  - pip
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