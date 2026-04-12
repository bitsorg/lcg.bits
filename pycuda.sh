package: pycuda
description: pycuda Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycuda-unknown.tar.gz
requires:
  - Python
  - setuptools
  - appdirs
  - decorator
  - mako
  - pytest
  - py_tools
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