package: cryptography
description: cryptography Python package
version: "46.0.3"
tag: "46.0.3"
requires:
  - Python
  - setuptools
  - asn1crypto
  - cffi
  - six
  - pip
  - typing_extensions
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