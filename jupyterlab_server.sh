package: jupyterlab_server
description: jupyterlab_server server components for JupyterLab
version: "2.27.3"
tag: "2.27.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - jupyter_server
  - pyjson5
  - babel
  - jsonschema
  - packaging
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