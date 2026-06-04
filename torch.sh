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
  # PyTorch ships its CMake config (TorchConfig.cmake + the Caffe2 configs it
  # pulls in) inside the pip site-packages tree, not under <prefix>/{lib,share}/
  # cmake. Consumers must point find_package(Torch) directly at that dir via
  # Torch_DIR (see the torch consumer recipes), because:
  #   * a dependency's modulefile setenv does NOT reach a consumer's *build* env;
  #   * a symlink under <prefix>/share/cmake makes find_package locate the config
  #     but breaks Caffe2Targets.cmake, which derives its install prefix by going
  #     UP from the cmake dir and would then look for the libs under <prefix>/lib
  #     instead of the real .../site-packages/torch/lib.
  # Expose Torch_DIR via the modulefile here for runtime `module load` use.
  PYVER=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])' 2>/dev/null || echo python3)
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << MODEOF
setenv Torch_DIR \$PKG_ROOT/lib/${PYVER}/site-packages/torch/share/cmake/Torch
MODEOF
}
##############################