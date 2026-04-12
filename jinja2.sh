package: Jinja2
description: Jinja2 Python package
version: "3.1.6"
tag: "3.1.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Jinja2-3.1.6.tar.gz
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