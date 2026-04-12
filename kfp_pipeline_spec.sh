package: kfp_pipeline_spec
description: kfp_pipeline_spec Python package
version: "0.6.0"
tag: "0.6.0"
requires:
  - Python
  - pip
  - protobuf
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