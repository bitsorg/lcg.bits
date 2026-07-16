package: prctl
description: prctl Linux process control utility
version: "1.8.1"
source: https://github.com/seveas/python-prctl
tag: "v%(version)s"
sources:
  - https://files.pythonhosted.org/packages/source/p/python-prctl/python-prctl-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################