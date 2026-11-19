package: fpdf2
description: fpdf2 minimalist PDF creation library for Python
version: "2.7.9"
tag: "2.7.9"
requires:
  - Python
  - defusedxml
  - pillow
  - fonttools
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