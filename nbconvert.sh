package: nbconvert
description: nbconvert Python package
version: "7.16.4"
tag: "7.16.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nbconvert-7.16.4.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - mistune
  - Jinja2
  - pygments
  - jupyterlab_pygments
  - traitlets
  - jupyter_core
  - nbformat
  - entrypoints
  - bleach
  - pandocfilters
  - testpath
  - defusedxml
  - importlib_metadata
  - tinycss2
  - beautifulsoup4
  # optional:
  # - nbclient
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