package: logilabcommon
description: logilabcommon Python package
version: "1.8.1"
tag: "1.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/logilab-common-1.8.1.tar.gz
requires:
  - Python
  - setuptools
  - six
  - pytest
  - mypy_extensions
  - typing_extensions
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