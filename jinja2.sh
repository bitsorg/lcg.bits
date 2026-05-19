package: Jinja2
description: Jinja2 fast and extensible Python templating engine
version: "3.1.6"
tag: "3.1.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Jinja2-3.1.6.tar.gz
requires:
  - Python
  - MarkupSafe
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################