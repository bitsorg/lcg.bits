package: numpy
description: NumPy fundamental package for array computing in Python
version: "2.4.0"
tag: "2.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numpy-2.4.0.tar.gz
requires:
  - Python
  - setuptools
  - blas
  - cython
  - pip
  - meson
  - meson_python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
[ "$(uname -m)" = "aarch64" ] && export CFLAGS="${CFLAGS:-} -O0"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"

function MakeInstall() {
  echo "=== numpy build diagnostics ===" >&2
  echo "PYTHONPATH: ${PYTHONPATH}" >&2
  echo "MESON_PYTHON_ROOT: ${MESON_PYTHON_ROOT}" >&2
  "${PYTHON_EXE}" -c "import mesonpy; print('mesonpy OK:', mesonpy.__file__)" >&2 \
    || echo "ERROR: mesonpy not importable" >&2
  echo "===============================" >&2
  mkdir -p "${SITE_PACKAGES}"
  local _pip_extra=""
  [ "$(uname -s)" = "Darwin" ] && _pip_extra="-Csetup-args=-Dblas=openblas -Csetup-args=-Dlapack=openblas"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" ${_pip_extra} .
}
##############################
