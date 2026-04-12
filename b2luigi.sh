package: b2luigi
description: b2luigi Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/b2luigi-unknown.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - luigi
  - tenacity
  - Jinja2
  - colorama
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