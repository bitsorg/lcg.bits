package: jupyter_packaging
description: jupyter_packaging Python package
version: "0.12.3"
tag: "0.12.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyter_packaging-0.12.3.tar.gz
requires:
  - Python
  - setuptools
  - packaging
  - deprecation
  - tomlkit
  - wheel
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################