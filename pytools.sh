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
  - pox
  - ppft
  - pytz
  - qtconsole
  - m2crypto
  # optional:
  # - cx_oracle
  # - py2neo
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
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # pip build isolation can't find a working setuptools backend; pytools is pure
  # Python, so --no-build-isolation uses the bits Python's own setuptools/wheel.
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" \
    "${PYPI_NAME:-${PKGNAME}}==${PKGVERSION}"
  if [ -z "$(ls -A "${SITE_PACKAGES}" 2>/dev/null)" ]; then
    echo "pytools: pip exited 0 but ${SITE_PACKAGES} is empty" >&2
    return 1
  fi
}
##############################