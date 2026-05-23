package: nbformat
description: nbformat Jupyter notebook file format reference implementation
version: "5.9.1"
tag: "5.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - traitlets
  - jupyter_core
  - jsonschema
  - fastjsonschema
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