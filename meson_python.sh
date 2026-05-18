package: meson_python
description: meson-python - Meson Python build backend (mesonpy)
version: "0.19.0"
tag: "0.19.0"
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
