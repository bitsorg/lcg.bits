package: pyopencl
description: pyopencl Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyopencl-unknown.tar.gz
requires:
  - Python
  - setuptools
  - py_tools
  - appdirs
  - six
  - decorator
  - mako
  - pybind11
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