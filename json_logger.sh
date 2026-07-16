package: json_logger
description: json-logger JSON log formatter for Python
version: "2.0.7"
source: https://github.com/madzak/python-json-logger
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-json-logger-2.0.7.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################