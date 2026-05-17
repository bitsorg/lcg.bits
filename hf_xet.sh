package: hf_xet
description: hf-xet Hugging Face Xet large-file storage backend
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hf_xet-1.2.0.tar.gz
requires:
  - Python
  - pip
  - rust
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - hf_xet-1.2.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################