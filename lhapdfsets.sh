package: lhapdfsets
description: Additional LHAPDF PDF data sets
version: "6.5.5"
source: https://github.com/scarrazza/lhapdf
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LHAPDF-6.5.5.tar.gz
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
