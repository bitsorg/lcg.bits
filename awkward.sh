package: awkward
description: awkward Python package
version: "2.9.0"
tag: "2.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/awkward-2.9.0.tar.gz
requires:
  - numpy
  - pytest_runner
  - PyYAML
  - awkward_cpp
  - importlib_metadata
  - packaging
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