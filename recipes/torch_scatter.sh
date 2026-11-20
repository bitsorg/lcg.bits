package: torch_scatter
description: torch-scatter segment-based reduction operations
version: "2.1.2"
tag: "2.1.2"
requires:
  - torch
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
  # torch_scatter builds a C++ extension whose setup.py imports torch. Use
  # --no-build-isolation so pip sees the bits env's torch (else "No module named 'torch'"),
  # and add each dep's site-packages (torch, sympy, numpy) to PYTHONPATH ($*_ROOT isn't enough).
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
    echo "torch_scatter: pip exited 0 but ${SITE_PACKAGES} is empty" >&2
    return 1
  fi
}
##############################