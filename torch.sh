package: torch
description: PyTorch open-source machine learning framework
version: "2.11.0"
tag: "2.11.0"
requires:
  - Python
  - PyYAML
  - cffi
  - numpy
  - blas
  - CMake
  - ninja
  - networkx
  - Jinja2
  - sympy
  - filelock
  - typing_extensions
  - fsspec
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # The default PyPI torch Linux wheel is CUDA-enabled: importing it preloads
  # libcudart/libcublasLt and hard-fails on a CPU-only host (and pulls the
  # nvidia-* packages bits does not provide).  This stack is CPU-only (no cuda
  # package; cuda is optional/commented in the torch_* recipes), so install the
  # CPU build from PyTorch's CPU index.  "==${PKGVERSION}" matches the
  # "${PKGVERSION}+cpu" local-version wheel published there (PEP 440).
  "${PYTHON_EXE}" -m pip install \
    --no-deps --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" \
    --index-url https://download.pytorch.org/whl/cpu \
    "torch==${PKGVERSION}"
  if [ -z "$(ls -A "${SITE_PACKAGES}" 2>/dev/null)" ]; then
    echo "torch: pip exited 0 but ${SITE_PACKAGES} is empty" >&2
    echo "torch: check that torch==${PKGVERSION} (CPU) exists on https://download.pytorch.org/whl/cpu" >&2
    return 1
  fi
}
function PostInstall() {
  # PyTorch ships its CMake package config (TorchConfig.cmake + the Caffe2
  # configs it pulls in) inside the pip site-packages tree, not under the usual
  # <prefix>/{lib,share}/cmake, so downstream find_package(Torch) fails
  # (k4rectracker, marlinmlflavortagging, ddml, torch_geometric, ...).
  PYVER=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])' 2>/dev/null || echo python3)

  # Build-time fix: bits puts $TORCH_ROOT on the consumers' CMAKE_PREFIX_PATH and
  # CMake searches <prefix>/share/cmake/<pkg>/. Symlink that standard location at
  # the pip cmake dir (which holds Torch/ and Caffe2/) so find_package(Torch)
  # resolves with no Torch_DIR needed. A dependency's modulefile setenv does NOT
  # reach a consumer's *build* environment, so the modulefile alone is not
  # enough. Relative symlink => relocation-safe.
  mkdir -p "$INSTALLROOT/share"
  ln -sfn "../lib/${PYVER}/site-packages/torch/share/cmake" "$INSTALLROOT/share/cmake"

  # Runtime fix: also expose Torch_DIR via the modulefile for `module load`.
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << MODEOF
setenv Torch_DIR \$PKG_ROOT/lib/${PYVER}/site-packages/torch/share/cmake/Torch
MODEOF
}
##############################