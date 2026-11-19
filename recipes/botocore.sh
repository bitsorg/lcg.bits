package: botocore
description: Botocore low-level AWS service interface library
version: "1.35.48"
tag: "1.35.48"
requires:
  - Python
  - jmespath
  - python_dateutil
  - urllib3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################