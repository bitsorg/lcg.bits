package: tvm
description: Apache TVM deep learning compiler and ML compilation framework
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-tvm-src-vunknown.tar.gz
requires:
  - xgboost
  - protobuf
  - llvmmin
  - numpy
  - pytest
  - cython
  - bzip2
  - scipy
  - Python
  - setuptools
  - attrs
  - cloudpickle
  - decorator
  - synr
  - tornado
  - psutil
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################