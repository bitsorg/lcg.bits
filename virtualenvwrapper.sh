package: virtualenvwrapper
description: virtualenvwrapper extensions to virtualenv
version: "4.8.4"
tag: "4.8.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - virtualenv
  - virtualenv_clone
  - stevedore
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