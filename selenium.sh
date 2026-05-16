package: selenium
description: Selenium web browser automation framework
version: "4.28.0"
tag: "4.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/selenium-4.28.0.tar.gz
requires:
  - Python
  - pip
  - rust
  - certifi
  - trio
  - trio_websocket
  - typing_extensions
  - urllib3
  - websocket_client
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