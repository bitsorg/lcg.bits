package: pyzmq
description: PyZMQ Python bindings for ZeroMQ
version: "26.2.1"
tag: "26.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyzmq-26.2.1.tar.gz
requires:
  - Python
  - setuptools
  - zeromq
  - cython
  - cffi
  - py
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################