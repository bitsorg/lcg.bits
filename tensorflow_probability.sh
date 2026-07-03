package: tensorflow_probability
description: TensorFlow Probability probabilistic deep learning library
version: "0.25.0"
tag: "0.25.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tensorflow-probability-0.25.0.tar.gz
requires:
  - Python
  - absl_py
  - six
  - numpy
  - decorator
  - cloudpickle
  - gast
  - dm_tree
  - looseversion
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - tensorflow_probability-0.25.0.patch
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