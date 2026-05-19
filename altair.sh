package: altair
description: Altair declarative statistical visualization in Python
version: "5.2.0"
tag: "5.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/altair-5.2.0.tar.gz
requires:
  - Python
  - Jinja2
  - jsonschema
  - numpy
  - packaging
  - pandas
  - toolz
  - typing_extensions
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