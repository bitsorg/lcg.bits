package: requests_unixsocket
description: requests_unixsocket Python package
version: "0.2.0"
tag: "0.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/requests-unixsocket-0.2.0.tar.gz
requires:
  - Python
  - setuptools
  - requests
  - urllib3
  - pbr
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