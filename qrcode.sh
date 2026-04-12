package: qrcode
description: qrcode Python package
version: "7.4.2"
tag: "7.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qrcode-7.4.2.tar.gz
requires:
  - Python
  - pip
  - pypng
  - typing_extensions
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