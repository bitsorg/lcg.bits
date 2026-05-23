package: pydantic_extra_types
description: pydantic-extra-types extra type definitions for Pydantic
version: "2.10.5"
tag: "2.10.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - pycountry
  - pydantic
  - typing_extensions
  - python_ulid
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################