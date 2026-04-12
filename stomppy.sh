package: stomppy
description: stomppy Python package
version: "6.1.0"
tag: "6.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/stomp.py-6.1.0.tar.gz
requires:
  - Python
  - setuptools
  - docopt
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