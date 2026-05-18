package: lhapdf
description: LHAPDF parton density function interpolation library
version: "6.2.3"
tag: "6.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LHAPDF-6.2.3.tar.gz
requires:
  - Python
  - cython
  - setuptools
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - lhapdf-6.2.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .

  # LHAPDF 6.2.x Python bindings support Python 2 only; disable with Python 3
  DISABLE_PYTHON=""
  if python3 -c '' 2>/dev/null || \
     python -c 'import sys; exit(0 if sys.version_info.major >= 3 else 1)' 2>/dev/null; then
    DISABLE_PYTHON="--disable-python"
  fi

  export LIBRARY_PATH="${LD_LIBRARY_PATH}"

  autoreconf --force --install
  ./configure --prefix="$INSTALLROOT" ${DISABLE_PYTHON}
}
function PostInstall() {
  # Normalise lib/lib64 so module paths work consistently
  pushd "$INSTALLROOT"
    if [[ ! -d lib && -d lib64 ]]; then
      ln -nfs lib64 lib
    elif [[ -d lib && ! -d lib64 ]]; then
      ln -nfs lib lib64
    fi
  popd
}
