package: cpymad
description: cpymad Python bindings to MAD-X
version: "1.19.0"
tag: "1.19.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cython
  - numpy
  - minrpc
  - madx
  - importlib_resources
  - zipp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MAD-X
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################