package: mistral_common
description: mistral-common common utilities for Mistral models
version: "1.8.5"
source: https://github.com/mistralai/mistral-common
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - mistral_common-1.8.5.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################