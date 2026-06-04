package: sphinx_rtd_theme
description: sphinx-rtd-theme Read the Docs Sphinx theme
version: "3.0.2"
tag: "3.0.2"
requires:
  - Python
  - six
  - Jinja2
  - pygments
  - docutils
  - snowballstemmer
  - babel
  - alabaster
  - imagesize
  - requests
  - packaging
  - sphinx
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