package: torch_sparse
description: torch-sparse sparse matrix operations for PyTorch
version: "0.6.18"
tag: "0.6.18"
requires:
  - torch
  - scipy
  - sympy
  # CUDA (conditional: only when defaults set variable `cuda` truthy):
  - "cuda:(?cuda)"
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
  # setup.py imports torch at build time, so --no-build-isolation: use bits'
  # build env where torch lives, not a fresh overlay. The dependency
  # site-packages are already on PYTHONPATH via each dep's init.sh (the
  # from-modules default), so no manual reconstruction is needed here.
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" \
    "${PYPI_NAME:-${PKGNAME}}==${PKGVERSION}"
  if [ -z "$(ls -A "${SITE_PACKAGES}" 2>/dev/null)" ]; then
    echo "torch_sparse: pip exited 0 but ${SITE_PACKAGES} is empty" >&2
    return 1
  fi
}
##############################