package: gssapi
description: gssapi Python GSSAPI Kerberos authentication bindings
version: "1.8.3"
tag: "1.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gssapi-1.8.3.tar.gz
requires:
  - Python
  - setuptools
  - decorator
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################