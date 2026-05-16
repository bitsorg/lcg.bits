package: tex2pix
description: tex2pix convert LaTeX equations to images
version: "0.3.1"
tag: "0.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tex2pix-0.3.1.tar.gz
requires:
  - Python
  - pip
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