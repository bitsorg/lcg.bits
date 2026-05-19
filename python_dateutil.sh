package: python_dateutil
description: python-dateutil extensions to the standard datetime module
version: "2.9.0.post0"
tag: "2.9.0.post0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-dateutil-2.9.0.post0.tar.gz
requires:
  - Python
  - six
  - setuptools_scm
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################