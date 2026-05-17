package: sphinx
description: Sphinx Python documentation generator
version: "8.1.3"
tag: "8.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Sphinx-8.1.3.tar.gz
requires:
  - Python
  - setuptools
  - six
  - Jinja2
  - pygments
  - docutils
  - snowballstemmer
  - babel
  - alabaster
  - imagesize
  - requests
  - packaging
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################