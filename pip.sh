package: pip
description: pip the Python package installer
version: "26.2"
source: https://github.com/pypa/pip
tag: "%(version)s"
#sources:
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - pkg:pypi/pip@%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################

