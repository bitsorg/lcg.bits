package: pywt
description: PyWavelets wavelet transforms for Python
version: "1.6.0"
tag: "1.6.0"
requires:
  - Python
  - pillow
  - numpy
  - cython
  - meson_python
  - meson
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="PyWavelets"
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # pywt (meson-python) fails under pip build isolation on Python 3.13: the
  # isolated env pulls an incompatible Cython. Build with --no-build-isolation so
  # the bits-pinned cython/numpy/meson-python/ninja are used; put each dep's
  # site-packages on PYTHONPATH so pip's backend check imports them.
  local _r _sp
  for _r in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1); do
    _sp="${!_r}/lib/python${PYTHON_MAJOR_MINOR}/site-packages"
    [ -d "${_sp}" ] && export PYTHONPATH="${_sp}${PYTHONPATH:+:${PYTHONPATH}}"
  done
  # TEMP DIAGNOSTIC — capture the real-round meson failure (remove once diagnosed)
  echo "DIAG cython=$(command -v cython) [$(cython --version 2>&1)]" >&2
  echo "DIAG PYTHONPATH=$PYTHONPATH" >&2
  if ! "${PYTHON_EXE}" -m pip install \
       --no-deps --no-build-isolation --ignore-installed --no-clean -v \
       --root=/ --prefix="${INSTALLROOT}" \
       "${PYPI_NAME:-${PKGNAME}}==${PKGVERSION}"; then
    echo "===== DIAG meson-log(s) =====" >&2
    find /tmp -name meson-log.txt -newermt '-15 min' -exec cat {} + >&2 2>/dev/null || true
    return 1
  fi
  if [ -z "$(ls -A "${SITE_PACKAGES}" 2>/dev/null)" ]; then
    echo "pywt: pip exited 0 but ${SITE_PACKAGES} is empty" >&2
    return 1
  fi
}
