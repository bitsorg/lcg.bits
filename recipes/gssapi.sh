package: gssapi
description: gssapi Python GSSAPI Kerberos authentication bindings
version: "1.8.3"
tag: "1.8.3"
requires:
  - Python
  - decorator
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################