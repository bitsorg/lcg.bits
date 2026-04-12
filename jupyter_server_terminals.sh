package: jupyter_server_terminals
description: jupyter_server_terminals Python package
version: "0.5.3"
tag: "0.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_server_terminals-0.5.3.tar.gz
requires:
  - Python
  - pip
  - terminado
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