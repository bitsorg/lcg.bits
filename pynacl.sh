package: pynacl
description: pynacl Python package
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyNaCl-1.5.0.tar.gz
requires:
  - Python
  - setuptools
  - six
  - cffi
  - pycparser
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