package: tensorflow_io_gcs_filesystem
description: tensorflow_io_gcs_filesystem Python package
version: "unknown"
tag: "unknown"
requires:
  - Python
  - setuptools
  - pip
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