package: openpyxl
description: openpyxl Python library to read/write Excel 2010+ files
version: "3.1.5"
tag: "3.1.5"
requires:
  - Python
  - et_xmlfile
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