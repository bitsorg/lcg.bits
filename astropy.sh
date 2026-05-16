package: astropy
description: Astropy community Python package for astronomy
version: "6.1.4"
tag: "6.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/astropy-6.1.4.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - pyerfa
  - packaging
  - PyYAML
  - extension_helpers
  - Jinja2
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