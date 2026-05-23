package: nbconvert
description: nbconvert converts Jupyter notebooks to other formats
version: "7.16.4"
tag: "7.16.4"
requires:
  - Python
  - mistune
  - Jinja2
  - pygments
  - jupyterlab_pygments
  - traitlets
  - jupyter_core
  - nbformat
  - entrypoints
  - bleach
  - pandocfilters
  - defusedxml
  - importlib_metadata
  - tinycss2
  - beautifulsoup4
  # optional:
  # - nbclient
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