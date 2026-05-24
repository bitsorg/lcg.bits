package: lightning_utilities
description: lightning-utilities common utility functions for PyTorch Lightning
version: "0.12.0"
tag: "0.12.0"
requires:
  - packaging
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
PYPI_NAME="lightning-utilities"
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################