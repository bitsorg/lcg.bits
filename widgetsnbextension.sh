package: widgetsnbextension
description: widgetsnbextension IPython widgets for Jupyter notebook
version: "4.0.14"
tag: "4.0.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/widgetsnbextension-4.0.14.tar.gz
requires:
  - Python
  - setuptools
  - notebook
  - jupyter_core
  - ipython_genutils
  - traitlets
  - decorator
  - tornado
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################