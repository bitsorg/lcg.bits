package: kfp_server_api
description: KFP server REST API client
version: "2.4.0"
tag: "2.4.0"
requires:
  - Python
  - six
  - certifi
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