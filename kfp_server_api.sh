package: kfp_server_api
description: kfp_server_api Python package
version: "2.4.0"
tag: "2.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kfp_server_api-2.4.0.tar.gz
requires:
  - Python
  - six
  - certifi
  - python_dateutil
  - urllib3
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