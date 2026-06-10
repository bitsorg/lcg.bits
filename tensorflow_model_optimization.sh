package: tensorflow_model_optimization
description: TensorFlow Model Optimization toolkit
version: "0.8.0"
tag: "0.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/model-optimization-%(version)s.tar.gz
requires:
  - Python
  - six
  - numpy
  - dm_tree
  - absl_py
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - tensorflow_model_optimization-0.8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --python"
##############################
# macOS (case-insensitive FS): the root Bazel "BUILD" file collides with
# setuptools' "build/" output dir during the wheel build. It's Bazel-only and
# unused here, so remove it (Configure runs after Prepare, before pip install).
function Configure() {
  bits_is_macos && rm -f BUILD
  true
}
##############################