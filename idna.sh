package: idna
description: IDNA internationalized domain names support for Python
version: "3.10"
tag: "3.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/idna-3.10.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################