package: jupyter_contrib_nbextensions
description: Collection of unofficial Jupyter notebook extensions
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_contrib_nbextensions-unknown.tar.gz
requires:
  - jupyter
  - jupyter_nbextensions_configurator
  - jupyter_contrib_core
  - decorator
  - psutil
  - jupyter_highlight_selected_word
  - lxml
  - jsonschema
  - ipython_genutils
  - jupyter_latex_envs
  - jsonschema
  - jupyter_core
  - nbconvert
  - notebook
  - tornado
  - traitlets
  - jupyter_server
  # optional:
  # - functools32
  # - backports
  # - Python
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