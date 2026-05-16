package: prompt_toolkit
description: prompt_toolkit library for interactive command-line programs
version: "3.0.47"
tag: "3.0.47"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/prompt_toolkit-3.0.47.tar.gz
requires:
  - Python
  - setuptools
  - six
  - wcwidth
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################