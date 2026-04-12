package: pyarrow
description: pyarrow Python package
version: "${arrow_native_version}"
tag: "${arrow_native_version}"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-arrow-${arrow_native_version}.tar.gz
requires:
  - Python
  - pip
  - numpy
  - six
  - cython
  - arrow
  - pkg_config
  - setuptools_scm
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