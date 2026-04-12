package: requests_oauthlib
description: requests_oauthlib Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################