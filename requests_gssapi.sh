package: requests_gssapi
description: requests-gssapi GSSAPI/Kerberos auth for the requests library
version: "1.2.3"
tag: "1.2.3"
requires:
  - Python
  - requests
  - gssapi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################