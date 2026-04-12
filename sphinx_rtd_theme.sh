package: sphinx_rtd_theme
description: sphinx_rtd_theme Python package
version: "3.0.2"
tag: "3.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sphinx_rtd_theme-3.0.2.tar.gz
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
  - sphinx
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