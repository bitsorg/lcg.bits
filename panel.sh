package: panel
description: Panel high-level app and dashboarding for Python
version: "1.1.0"
tag: "1.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - pyct
  - numpy
  - pyviz_comms
  - bokeh
  - param
  - markdown
  - requests
  - tqdm
  - bleach
  - pandas
  - linkify_it_py
  - markdown_it_py
  - mdit_py_plugins
  # optional:
  # - nodejs
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - panel-1.1.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
