package: mysql_connector_python
description: MySQL Connector/Python official MySQL database driver
version: "9.4.0"
tag: "9.4.0"
requires:
  - Python
  - mysql
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################