package: shellingham
description: shellingham detect surrounding shell for Python
version: "1.5.4"
tag: "1.5.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/shellingham-1.5.4.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################