package: requests_gssapi
description: requests-gssapi GSSAPI/Kerberos auth for the requests library
version: "1.2.3"
tag: "1.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/requests-gssapi-1.2.3.tar.gz
requires:
  - Python
  - setuptools
  - requests
  - gssapi
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################