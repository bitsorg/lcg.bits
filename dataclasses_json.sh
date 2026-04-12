package: dataclasses_json
description: dataclasses_json Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################