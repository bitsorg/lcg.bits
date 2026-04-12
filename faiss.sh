package: faiss
description: faiss Python package
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