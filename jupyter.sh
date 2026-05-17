package: jupyter
description: Jupyter metapackage for Jupyter notebook and client
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter-1.0.0.tar.gz
requires:
  - Python
  - setuptools
  - metakernel
  - pyzmq
  - tornado
  - pygments
  - mistune
  - MarkupSafe
  - jsonschema
  - Jinja2
  - certifi
  - ipython
  - terminado
  - nbconvert
  - nbformat
  - ipykernel
  - ipywidgets
  - jupyter_client
  - jupyter_console
  - jupyter_core
  - notebook
  - qtconsole
  - entrypoints
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - jupyter-1.0.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################