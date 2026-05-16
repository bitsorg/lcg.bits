package: fs
description: PyFilesystem2 filesystem abstraction layer for Python
version: "2.4.16"
tag: "2.4.16"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fs-2.4.16.tar.gz
requires:
  - Python
  - setuptools
  - six
  - appdirs
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################