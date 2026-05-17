package: gcovr
description: gcovr Gcov coverage reports generator
version: "7.2"
tag: "7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gcovr-7.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - lxml
  - Jinja2
  - pygments
  - colorlog
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