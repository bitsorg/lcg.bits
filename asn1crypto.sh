package: asn1crypto
description: asn1crypto fast Python ASN.1 parser and serializer
version: "1.5.1"
tag: "1.5.1"
sources:
  - https://files.pythonhosted.org/packages/source/a/asn1crypto/%(name)s-%(version)s.tar.gz
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