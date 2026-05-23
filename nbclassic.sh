package: nbclassic
description: nbclassic classic Jupyter Notebook interface
version: "1.3.3"
tag: "1.3.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - jupyter_server
  - babel
  - ipykernel
  - notebook_shim
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