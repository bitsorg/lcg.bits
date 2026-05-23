package: b2luigi
description: b2luigi workflow management based on Luigi (Belle II)
version: "1.2.6"
tag: "1.2.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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