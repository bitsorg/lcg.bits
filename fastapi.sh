package: fastapi
description: fastapi Python package
version: "0.119.0"
tag: "0.119.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fastapi-0.119.0.tar.gz
requires:
  - Python
  - pip
  - pydantic
  - starlette
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