package: uri_template
description: uri-template URI template parsing and expansion (RFC 6570)
version: "1.3.0"
tag: "1.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uri-template-1.3.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################