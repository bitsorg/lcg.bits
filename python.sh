package: Python
description: CPython interpreter and standard library
version: "3.13.11"
source: https://github.com/python/cpython
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --python"
##############################
# Derive PYTHON_MAJOR_MINOR from the package version (e.g. 3.14.0 -> 3.14)
PYTHON_MAJOR_MINOR=$(echo "$PKGVERSION" | cut -d. -f1,2)
##############################
function Configure() {
  # Strip other python installations from PATH to avoid contamination
  export PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=':' '!/python/ {print}' | sed 's/:$//')

  # python3 finds its libpython wherever it is installed; NODIST keeps the flag
  # out of LDFLAGS and python3-config, so extensions and embedders do not get it.
  $SOURCEDIR/configure --prefix="$INSTALLROOT" \
    --enable-shared \
    --with-ensurepip=install \
    LDFLAGS_NODIST='-Wl,-rpath,\$$ORIGIN/../lib' \
    ${Python_config_options} \
    ${Python_config_flags} \
    CXX=$CXX CC=$CC
}
function PostInstall() {
  # Create canonical python3/pip/pip3 symlinks
  pushd "$INSTALLROOT/bin"
    PYTHON_BIN=$(for x in python*; do echo "$x"; done | grep -E '^python[0-9]+\.[0-9]+$' | head -n1)
    PIP_BIN=$(for x in pip*; do echo "$x"; done | grep -E '^pip[0-9]+\.[0-9]+$' | head -n1)
    [[ $PYTHON_BIN && ! -x python  ]] && ln -nfs "$PYTHON_BIN" python
    [[ $PYTHON_BIN && ! -x python3 ]] && ln -nfs "$PYTHON_BIN" python3
    [[ $PIP_BIN    && ! -x pip     ]] && ln -nfs "$PIP_BIN" pip
    [[ $PIP_BIN    && ! -x pip3    ]] && ln -nfs "$PIP_BIN" pip3
  popd
  # Uniform python library symlink: lib/python -> lib/python3.x
  pushd "$INSTALLROOT/lib"
    find "$PWD" -maxdepth 1 -name "python3.*" -type d | while read d; do
      [[ ! -e python ]] && ln -nfs "$(basename "$d")" python
    done
  popd
  # Build backends pip needs without build isolation (ensurepip has no setuptools
  # since 3.12), pinned for a reproducible Python: the recipes' versions where
  # there is one. pytest comes from its own recipe.
  preload="setuptools==80.10.2 wheel==0.45.1 hatchling==1.28.0 hatch-vcs==0.5.0
           hatch-fancy-pypi-readme==25.1.0 flit==4.1.0 flit_core==4.1.0 PyYAML==6.0.2"
  env LD_LIBRARY_PATH="${INSTALLROOT}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" \
    "$INSTALLROOT/bin/python3" -m pip install $preload
}
