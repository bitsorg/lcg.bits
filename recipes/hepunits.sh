package: hepunits
description: hepunits physical units and constants for Python (HEP)
version: "2.4.3"
tag: "2.4.3"
requires:
  - Python
  - attrs
  - pint
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################