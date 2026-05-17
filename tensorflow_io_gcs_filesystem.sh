package: tensorflow_io_gcs_filesystem
description: TensorFlow I/O GCS filesystem plugin
version: "unknown"
tag: "unknown"
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################