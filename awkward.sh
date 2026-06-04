package: awkward
description: Awkward Array manipulate jagged/nested arrays like NumPy
version: "2.9.0"
tag: "2.9.0"
requires:
  - hatchling
  - numpy
  - pytest_runner
  - PyYAML
  - awkward_cpp
  - importlib_metadata
  - packaging
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################