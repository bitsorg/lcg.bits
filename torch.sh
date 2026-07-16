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
  # The default PyPI torch Linux wheel is CUDA-enabled and hard-fails on a CPU-only host
  # (and pulls nvidia-* packages bits lacks); this stack is CPU-only, so install the CPU
  # build from PyTorch's CPU index. "==${PKGVERSION}" matches the "+cpu" local-version wheel.
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
  # PyTorch ships its CMake config (TorchConfig/Caffe2) inside the pip site-packages tree,
  # not <prefix>/*/cmake; consumers must point find_package(Torch) there via Torch_DIR (a
  # dep modulefile setenv doesn't reach their build env, and a symlink breaks Caffe2Targets).
  PYVER=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])' 2>/dev/null || echo python3)
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << MODEOF
setenv Torch_DIR \$PKG_ROOT/lib/${PYVER}/site-packages/torch/share/cmake/Torch
MODEOF
}
##############################