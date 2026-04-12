package: astroid
description: astroid Python package
version: "4.0.2"
tag: "4.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/astroid-4.0.2.tar.gz
requires:
  - Python
  - setuptools
  - lazy_object_proxy
  - six
  - wrapt
  - pytest_runner
  - pip
  - typing_extensions
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