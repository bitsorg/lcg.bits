package: hepmc3
description: HepMC3 Monte Carlo event record library
version: "3.3.1"
tag: "3.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepMC3-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  # Direct dependency so Python_ROOT and Python_config_version_twodigit[_nodot]
  # are exported into the build env (ROOT only pulls Python transitively, which
  # does not propagate those vars). Without them the SITEARCH / PYTHON_VERSIONS /
  # Python_EXECUTABLE overrides below expand empty and CMake picks the Homebrew
  # system Python instead, installing the bindings outside INSTALLROOT.
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  # macOS: CMake's find_package(Python) prefers Homebrew's system Python (3.14)
  # over the bits Python, so HepMC3 builds the bindings for 3.14 and installs them
  # into /opt/homebrew/lib/python3.14/site-packages (EPERM). Worse, the existing
  # SITEARCH/PYTHON_VERSIONS overrides reference ${Python_config_version_twodigit}
  # — a variable that is defined nowhere, so they always expand empty and HepMC3
  # falls back to the detected interpreter's site-packages. On Darwin: pin the
  # interpreter to the bits Python and compute the version from Python_ROOT, so
  # the bindings build for the bits Python and install into INSTALLROOT. Gated to
  # Darwin so the (unchanged) Linux path is byte-identical.
  local _py=()
  if [ "$(uname)" = Darwin ]; then
    local _pyexe="${Python_ROOT}/bin/python3"
    local _pyver _pynodot
    _pyver=$("$_pyexe" -c 'import sys;print("%d.%d"%sys.version_info[:2])' 2>/dev/null)
    [ -z "$_pyver" ] && _pyver=$(basename "$(ls -d "${Python_ROOT}"/lib/python3.* 2>/dev/null | head -1)" | sed 's/python//')
    _pynodot=${_pyver//./}
    _py+=(
      -DPython_EXECUTABLE="${_pyexe}"
      -DPython3_EXECUTABLE="${_pyexe}"
      -DHEPMC3_Python_SITEARCH${_pynodot}="${INSTALLROOT}/lib/python${_pyver}/site-packages"
      -DHEPMC3_PYTHON_VERSIONS="${_pyver}"
    )
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOT_DIR="${ROOT_ROOT}" \
    -DHEPMC3_INSTALL_INTERFACES=ON \
    -DHEPMC3_Python_SITEARCH${Python_config_version_twodigit_nodot}=$INSTALLROOT/lib/python${Python_config_version_twodigit}/site-packages \
    -DHEPMC3_PYTHON_VERSIONS="${Python_config_version_twodigit}" \
    "${_py[@]}"
}
