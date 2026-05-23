package: python_gitlab
description: python-gitlab Python wrapper for the GitLab REST API
version: "1.8.0"
tag: "1.8.0"
requires:
  - Python
  - six
  - requests
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################