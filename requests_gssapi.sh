package: requests_gssapi
description: requests_gssapi Python package
version: "1.2.3"
tag: "1.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/requests-gssapi-1.2.3.tar.gz
requires:
  - Python
  - setuptools
  - requests
  - gssapi
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