package: auth_get_sso_cookie
description: auth-get-sso-cookie CERN SSO cookie helper
version: "2.4.0-1"
tag: "2.4.0-1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/auth-get-sso-cookie-2.4.0-1.tar.gz
requires:
  - Python
  - setuptools
  - requests
  - requests_gssapi
  - beautifulsoup4
  - Authlib
  - qrcode
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