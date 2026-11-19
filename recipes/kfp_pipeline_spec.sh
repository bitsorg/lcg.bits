package: kfp_pipeline_spec
description: KFP Pipeline spec protobuf definitions
version: "0.6.0"
tag: "0.6.0"
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