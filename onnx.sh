package: onnx
description: ONNX Open Neural Network Exchange format library
version: "1.16.0"
tag: "1.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - absl
  - protobuf
  - typing_extensions
  - numpy
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - onnx-1.16.0.patch
---
#!/bin/bash -e
# onnx's setup.py invokes cmake directly and never passes CMAKE_PREFIX_PATH,
# so cmake 3.27+ (CMP0144) cannot locate absl/protobuf config files via the
# *_ROOT env vars it ignores.  Inject the prefix path through CMAKE_ARGS,
# which onnx's setup.py reads and appends to its cmake command line.
_pfx=""
for _v in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
  _d="${!_v}"; [ -d "$_d" ] && _pfx="${_pfx:+$_pfx;}$_d"
done
[ -n "$_pfx" ] && export CMAKE_ARGS="${CMAKE_ARGS:+$CMAKE_ARGS }-DCMAKE_PREFIX_PATH=$_pfx"
unset _pfx _v _d
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################