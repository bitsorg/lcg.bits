package: google_auth_oauthlib
description: google-auth-oauthlib OAuthlib integration for google-auth
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-auth-oauthlib-1.0.0.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################