package: google_auth_oauthlib
description: google-auth-oauthlib OAuthlib integration for google-auth
version: "1.0.0"
tag: "1.0.0"
requires:
  - Python
  - google_auth
  - requests_oauthlib
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