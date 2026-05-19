package: onnxruntime
description: ONNX Runtime cross-platform ML model inference engine
version: "1.24.4"
tag: "1.24.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/onnxruntime-1.24.4.tar.gz
requires:
  - Python
  - six
  - wheel
  - blas
  - numpy
  - onnx
  - torch
  - packaging
  - coloredlogs
  - sympy
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
function PostInstall() {
  printf 'prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include/onnxruntime\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
