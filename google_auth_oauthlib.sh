package: google_auth_oauthlib
description: google_auth_oauthlib Python package
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-auth-oauthlib-1.0.0.tar.gz
requires:
  - Python
  - setuptools
  - google_auth
  - requests_oauthlib
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