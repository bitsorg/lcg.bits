package: requests
description: Requests elegant HTTP library for Python
version: "2.32.3"
tag: "2.32.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/requests-2.32.3.tar.gz
requires:
  - Python
  - setuptools
  - charset_normalizer
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################