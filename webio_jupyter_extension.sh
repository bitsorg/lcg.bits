package: webio_jupyter_extension
description: WebIO Jupyter extension for interactive web I/O
version: "0.1.0"
tag: "0.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/webio_jupyter_extension-0.1.0.tar.gz
requires:
  - Python
  - setuptools
  - jupyter_packaging
  - notebook
  - rust
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - webio_jupyter_extension-0.1.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################