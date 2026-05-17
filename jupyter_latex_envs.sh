package: jupyter_latex_envs
description: Jupyter extension for LaTeX environments in notebooks
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
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################