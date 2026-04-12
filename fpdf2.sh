package: fpdf2
description: fpdf2 Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################