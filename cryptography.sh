package: cryptography
description: "cryptography Python package: cryptographic primitives"
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################