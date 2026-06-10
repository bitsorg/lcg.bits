package: Python
description: CPython interpreter and standard library
version: "3.13.11"
tag: "3.13.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
# PostInstall's `pip install --upgrade` needs outbound network, which the macOS
# sandbox-exec wrapper blocks by default; allow it here.
sandbox_network: "off"
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

  $SOURCEDIR/configure --prefix="$INSTALLROOT" \
    --enable-shared \
    --with-ensurepip=install \
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
  # Bootstrap setuptools/wheel: since 3.12 ensurepip no longer bundles setuptools,
  # so pip build isolation can't find the setuptools backend (e.g. XRootD).
  preload="setuptools wheel hatchling hatch-vcs hatch-fancy-pypi-readme flit flit_core pytest pytest_cov PyYAML"
  env LD_LIBRARY_PATH="${INSTALLROOT}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"  $INSTALLROOT/bin/python3 -m pip install --upgrade $preload
}
