package: pycpuinfo
description: py-cpuinfo get CPU info with pure Python
version: "9.0.0"
source: https://github.com/workhorsy/py-cpuinfo
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py-cpuinfo-9.0.0.tar.gz
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