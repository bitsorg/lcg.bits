package: meson_python
description: meson-python - Meson Python build backend (mesonpy)
version: "0.17.1"
tag: "0.17.1"
requires:
  - Python
  - pip
  - meson
  - pyproject_metadata
  - tomli
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
