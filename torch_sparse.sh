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
  # torch_sparse compiles a C++/CUDA extension and its setup.py imports torch at
  # build time.  Two adjustments vs the default pip install:
  #  * --no-build-isolation, so pip uses the bits build env (where torch lives)
  #    instead of a fresh overlay that lacks torch ("ModuleNotFoundError: No
  #    module named 'torch'").
  #  * add every dependency's site-packages (torch, scipy, sympy, numpy) to
  #    PYTHONPATH — the build env exposes $*_ROOT but not site-packages.
  local _r _sp
  for _r in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1); do
    _sp="${!_r}/lib/python${PYTHON_MAJOR_MINOR}/site-packages"
    [ -d "${_sp}" ] && export PYTHONPATH="${_sp}${PYTHONPATH:+:${PYTHONPATH}}"
  done
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