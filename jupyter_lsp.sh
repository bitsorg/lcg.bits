package: jupyter_lsp
description: jupyter-lsp Language Server Protocol support for JupyterLab
version: "2.2.5"
tag: "2.2.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter-lsp-2.2.5.tar.gz
requires:
  - Python
  - pip
  - jupyter_server
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################