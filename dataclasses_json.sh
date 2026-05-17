package: dataclasses_json
description: dataclasses-json serialize dataclasses to/from JSON
version: "0.5.8"
tag: "0.5.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dataclasses-json-0.5.8.tar.gz
requires:
  - Python
  - pip
  - marshmallow
  - marshmallow_enum
  - typing_inspect
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