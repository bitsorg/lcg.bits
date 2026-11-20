package: googleapis_common_protos
description: googleapis-common-protos common Google API proto messages
version: "1.56.4"
tag: "1.56.4"
requires:
  - Python
  - protobuf
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