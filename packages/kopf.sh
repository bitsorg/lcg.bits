package: kopf
description: Kopf Kubernetes operator framework for Python
version: "1.40.0"
tag: "1.40.0"
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################