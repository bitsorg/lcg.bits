package: faiss
description: FAISS library for efficient similarity search (Facebook AI)
version: "1.11.0"
tag: "1.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/faiss-1.11.0.tar.gz
requires:
  - blas
  - Python
  - numpy
  - swig
  - packaging
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################