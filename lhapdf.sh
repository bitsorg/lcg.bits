package: lhapdf
description: LHAPDF parton density function interpolation library
version: "6.5.5"
tag: "6.5.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LHAPDF-6.5.5.tar.gz
requires:
  - Python
  - cython
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only
patches:
  - lhapdf-6.2.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {

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
  # Extend modulefile: data path used by all MC generators at runtime
  printf 'prepend-path LHAPDF_DATA_PATH $PKG_ROOT/share/LHAPDF\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
