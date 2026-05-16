package: jiter
description: jiter fast JSON iterator for Python (Rust-backed)
version: "0.11.0"
tag: "0.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jiter-0.11.0.tar.gz
requires:
  - Python
  - pip
  - rust
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