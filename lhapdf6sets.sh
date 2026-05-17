package: lhapdf6sets
description: LHAPDF6 PDF data sets
version: "unknown"
tag: "unknown"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-PDFSets
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS=""
##############################
