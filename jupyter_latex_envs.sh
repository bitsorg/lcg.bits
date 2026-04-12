package: jupyter_latex_envs
description: jupyter_latex_envs Python package
version: "1.4.6"
tag: "1.4.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_latex_envs-1.4.6.tar.gz
requires:
  - Python
  - setuptools
  - ipython
  - jupyter_core
  - nbconvert
  - notebook
  - traitlets
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