package: jupyter_highlight_selected_word
description: Jupyter extension to highlight all instances of selected word
version: "0.2.0"
tag: "0.2.0"
requires:
  - Python
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