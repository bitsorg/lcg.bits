package: itkwidgets
description: itkwidgets Python package
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