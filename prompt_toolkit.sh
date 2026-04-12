package: prompt_toolkit
description: prompt_toolkit Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################