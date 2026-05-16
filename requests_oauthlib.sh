package: requests_oauthlib
description: requests-oauthlib OAuthlib support for the requests library
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/requests-oauthlib-1.2.0.tar.gz
requires:
  - Python
  - setuptools
  - requests
  - oauthlib
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################