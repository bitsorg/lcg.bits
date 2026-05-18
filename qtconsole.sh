package: qtconsole
description: qtconsole Qt-based rich Jupyter terminal
version: "5.6.1"
tag: "5.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qtconsole-5.6.1.tar.gz
requires:
  - Python
  - setuptools
  - ipykernel
  - jupyter_client
  - pygments
  - traitlets
  - jupyter_core
  - Qt5
  - pip
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