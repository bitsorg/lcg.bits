package: jupyter_console
description: jupyter_console terminal-based Jupyter client
version: "6.6.3"
tag: "6.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_console-6.6.3.tar.gz
requires:
  - Python
  - setuptools
  - ipython
  - prompt_toolkit
  - pygments
  - ipykernel
  - jupyter_core
  - jupyter_client
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