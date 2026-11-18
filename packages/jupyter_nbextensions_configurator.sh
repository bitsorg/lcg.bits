package: jupyter_nbextensions_configurator
description: Jupyter server extension to configure nbextensions
version: "0.6.4"
tag: "0.6.4"
requires:
  - jupyter_contrib_core
  - PyYAML
  - traitlets
  - tornado
  - notebook
  - jupyter_core
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################