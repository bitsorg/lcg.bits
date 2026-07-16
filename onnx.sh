package: onnx
description: ONNX Open Neural Network Exchange format library
version: "1.16.0"
source: https://github.com/onnx/onnx
tag: "v%(version)s"
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
# onnx's setup.py never passes CMAKE_PREFIX_PATH, so cmake 3.27+ (CMP0144) can't
# find absl/protobuf via the *_ROOT vars. Inject the prefix path via CMAKE_ARGS,
# which setup.py appends to its cmake command line.
_pfx=""
for _v in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
  _d="${!_v}"; [ -d "$_d" ] && _pfx="${_pfx:+$_pfx;}$_d"
done
# Disable mypy stub generation — protoc-gen-mypy.py requires the Python
# google-protobuf package which is not available in this build environment.
export CMAKE_ARGS="${CMAKE_ARGS:+$CMAKE_ARGS }-DONNX_GEN_PB_TYPE_STUBS=OFF"
[ -n "$_pfx" ] && export CMAKE_ARGS="${CMAKE_ARGS:+$CMAKE_ARGS }-DCMAKE_PREFIX_PATH=$_pfx"
unset _pfx _v _d
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # setup.py asserts that .pyi stubs were generated even when
  # ONNX_GEN_PB_TYPE_STUBS=OFF skips protoc-gen-mypy.  Remove the assertion
  # so the wheel builds without the google-protobuf Python package.
  perl -i -pe 's/assert.*No generated python stubs found.*/pass  # stubs disabled/' setup.py
}