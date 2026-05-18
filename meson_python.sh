package: meson_python
description: meson-python - Meson Python build backend (mesonpy)
version: "0.17.1"
tag: "0.17.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/meson_python-0.17.1.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
