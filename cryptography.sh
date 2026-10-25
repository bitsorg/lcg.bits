package: cryptography
description: "cryptography Python package: cryptographic primitives"
version: "50.0.0"
tag: "50.0.0"
requires:
  - Python
  - asn1crypto
  - cffi
  - six
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################