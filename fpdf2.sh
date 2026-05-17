package: fpdf2
description: fpdf2 minimalist PDF creation library for Python
version: "2.7.9"
tag: "2.7.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fpdf2-2.7.9.tar.gz
requires:
  - Python
  - pip
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################