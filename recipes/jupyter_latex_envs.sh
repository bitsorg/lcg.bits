package: jupyter_latex_envs
description: Jupyter extension for LaTeX environments in notebooks
version: "1.4.6"
tag: "1.4.6"
requires:
  - Python
  - ipython
  - jupyter_core
  - nbconvert
  - notebook
  - traitlets
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################