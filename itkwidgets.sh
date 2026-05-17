package: itkwidgets
description: itkwidgets Jupyter widget for ITK image visualization
version: "1.0a53"
tag: "1.0a53"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/itkwidgets-1.0a53.tar.gz
requires:
  - colorcet
  - itk_core
  - itk_io
  - itk_filtering
  - itk_meshtopolydata
  - ipydatawidgets
  - ipywidgets
  - ipympl
  - zstandard
  - matplotlib
  - numpy
  - scipy
  - six
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################