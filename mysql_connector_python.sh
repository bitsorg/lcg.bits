package: mysql_connector_python
description: MySQL Connector/Python official MySQL database driver
version: "9.4.0"
tag: "9.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mysql_connector_python-9.4.0.tar.gz
requires:
  - Python
  - mysql
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################