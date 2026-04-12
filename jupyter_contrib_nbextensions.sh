package: jupyter_contrib_nbextensions
description: jupyter_contrib_nbextensions Python package
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