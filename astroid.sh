package: astroid
description: astroid Python AST framework used by pylint
version: "4.0.2"
tag: "4.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/astroid-4.0.2.tar.gz
requires:
  - Python
  - lazy_object_proxy
  - six
  - wrapt
  - pytest_runner
  - pip
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################