package: func_adl_xAOD
description: func_adl_xAOD ATLAS xAOD backend for func_adl
version: "2.1"
tag: "2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - func_adl
  - qastle
  - Jinja2
  - qastle
  - retry
  - requests
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