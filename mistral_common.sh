package: mistral_common
description: mistral_common Python package
version: "1.8.5"
tag: "1.8.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mistral_common-1.8.5.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - jsonschema
  - numpy
  - pillow
  - pydantic_extra_types
  - pydantic
  - requests
  - tiktoken
  - typing_extensions
  - uvicorn
  - fastapi
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - mistral_common-1.8.5.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################