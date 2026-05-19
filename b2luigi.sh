package: b2luigi
description: b2luigi workflow management based on Luigi (Belle II)
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/b2luigi-unknown.tar.gz
requires:
  - Python
  - pip
  - luigi
  - tenacity
  - Jinja2
  - colorama
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################