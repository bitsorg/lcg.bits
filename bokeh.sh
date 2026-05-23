package: bokeh
description: Bokeh interactive visualization library for modern browsers
version: "3.1.1"
tag: "3.1.1"
requires:
  - Python
  - PyYAML
  - python_dateutil
  - Jinja2
  - numpy
  - pillow
  - packaging
  - tornado
  - typing_extensions
  - xyzservices
  - contourpy
  - pandas
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