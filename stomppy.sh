package: stomppy
description: stomp.py STOMP message protocol client for Python
version: "6.1.0"
tag: "6.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/stomp.py-6.1.0.tar.gz
requires:
  - Python
  - setuptools
  - docopt
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################