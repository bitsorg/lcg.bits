package: werkzeug
description: werkzeug Python package
version: "3.1.3"
tag: "3.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Werkzeug-3.1.3.tar.gz
requires:
  - Python
  - setuptools
  - MarkupSafe
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