package: kopf
description: Kopf Kubernetes operator framework for Python
version: "1.40.0"
tag: "1.40.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kopf-1.40.0.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - aiohttp
  - aiosignal
  - frozenlist
  - iso8601
  - multidict
  - json_logger
  - yarl
  - click
  - PyYAML
  - typing_extensions
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