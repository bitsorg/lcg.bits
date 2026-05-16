package: pytools
description: pytools small Python utility functions collection
version: "2019.1.1"
tag: "2019.1.1"
requires:
  - lxml
  - sqlalchemy
  - genshi
  - ipython
  - simplejson
  - mock
  - setuptools
  - py
  - pytest
  - nose
  - coverage
  - chardet
  - stomppy
  - pyzmq
  - Jinja2
  - jsonschema
  - terminado
  - ptyprocess
  - pandas
  - pygments
  - mistune
  - prettytable
  - pip
  - PyYAML
  - pathos
  - prompt_toolkit
  - py4j
  - wheel
  - CouchDB
  - networkx
  - decorator
  - traitlets
  - requests
  - urllib3
  - dill
  - ipykernel
  - ipython_genutils
  - wcwidth
  - ipywidgets
  - jupyter
  - jupyter_client
  - jupyter_console
  - jupyter_core
  - MarkupSafe
  - python_gitlab
  - metakernel
  - nbconvert
  - nbformat
  - notebook
  - pexpect
  - pickleshare
  - pox
  - ppft
  - pytz
  - qtconsole
  - simplegeneric
  - simplejson
  - singledispatch
  - #
  - m2crypto
  - deleted
  # optional:
  # - cx_oracle
  # - py2neo
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