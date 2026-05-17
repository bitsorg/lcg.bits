package: python_gitlab
description: python-gitlab Python wrapper for the GitLab REST API
version: "1.8.0"
tag: "1.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-gitlab-1.8.0.tar.gz
requires:
  - Python
  - setuptools
  - six
  - requests
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################