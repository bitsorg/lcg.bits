package: requests
description: Requests elegant HTTP library for Python
version: "2.32.3"
tag: "2.32.3"
requires:
  - Python
  - charset_normalizer
  - chardet
  - idna
  - urllib3
  - certifi
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