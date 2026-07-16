package: humanfriendly
description: humanfriendly human-friendly output for Python
version: "10.0"
source: https://github.com/xolox/python-humanfriendly
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - docutils
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - humanfriendly-10.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################