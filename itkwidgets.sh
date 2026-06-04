package: itkwidgets
description: itkwidgets Jupyter widget for ITK image visualization
version: "1.0a53"
tag: "1.0a53"
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################