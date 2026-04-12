package: google_api_python_client
description: google_api_python_client Python package
version: "1.12.11"
tag: "1.12.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-api-python-client-1.12.11.tar.gz
requires:
  - Python
  - google_api_core
  - google_auth
  - six
  - uritemplate
  - #
  - google_auth_httplib2
  - httplib2
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