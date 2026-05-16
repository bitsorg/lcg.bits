package: jupyter_server
description: jupyter_server backend server for Jupyter web apps
version: "2.14.2"
tag: "2.14.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_server-2.14.2.tar.gz
requires:
  - anyio
  - Jinja2
  - tornado
  - pyzmq
  - ipython_genutils
  - traitlets
  - jupyter_core
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