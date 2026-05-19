package: jupyter_server_terminals
description: jupyter_server_terminals terminals support for jupyter_server
version: "0.5.3"
tag: "0.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_server_terminals-0.5.3.tar.gz
requires:
  - Python
  - terminado
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