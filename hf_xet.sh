package: hf_xet
description: hf-xet Hugging Face Xet large-file storage backend
version: "1.5.0"
tag: "1.5.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  pkgname="hf-xet"  
  mkdir -p "${SITE_PACKAGES}"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" \
    "${pkgname}==${PKGVERSION}"
  if [ -z "$(ls -A "${SITE_PACKAGES}" 2>/dev/null)" ]; then
    echo "PythonPipRecipe: pip exited 0 but ${SITE_PACKAGES} is empty" >&2
    echo "PythonPipRecipe: check that ${pkgname}==${PKGVERSION} exists on the configured index" >&2
    return 1
  fi
}

