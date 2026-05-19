package: typing_extensions
description: typing-extensions backport of Python typing module additions
version: "4.15.0"
tag: "4.15.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typing_extensions-4.15.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: PSF-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################