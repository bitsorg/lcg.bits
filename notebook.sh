package: notebook
description: notebook Python package
version: "7.4.5"
tag: "7.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/notebook-7.4.5.tar.gz
requires:
  - Python
  - Jinja2
  - tornado
  - pyzmq
  - argon2_cffi
  - traitlets
  - jupyter_core
  - jupyter_client
  - nbformat
  - nbconvert
  - ipykernel
  - send2trash
  - terminado
  - prometheus_client
  - requests
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