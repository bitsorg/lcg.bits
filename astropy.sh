package: astropy
description: Astropy community Python package for astronomy
version: "7.2.0"
tag: "7.2.0"
requires:
  - Python
  - numpy
  - pyerfa
  - packaging
  - PyYAML
  - extension_helpers
  - Jinja2
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