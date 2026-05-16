package: yarl
description: yarl yet another URL library for Python
version: "1.18.3"
tag: "1.18.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/yarl-1.18.3.tar.gz
requires:
  - Python
  - setuptools
  - idna
  - multidict
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################