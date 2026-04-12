package: sphinx
description: sphinx Python package
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