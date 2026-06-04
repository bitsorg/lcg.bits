package: requests_oauthlib
description: requests-oauthlib OAuthlib support for the requests library
version: "1.2.0"
tag: "1.2.0"
requires:
  - Python
  - requests
  - oauthlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################