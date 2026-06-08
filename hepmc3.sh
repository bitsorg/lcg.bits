package: hepmc3
description: HepMC3 Monte Carlo event record library
version: "3.3.1"
tag: "3.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepMC3-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
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
  # over the bits Python, so HepMC3 builds the bindings for 3.14 and tries to
  # install them into /opt/homebrew/lib/python3.14/site-packages (EPERM). The
  # SITEARCH/PYTHON_VERSIONS overrides below are keyed to the *bits* Python
  # version, so pin the interpreter to the bits Python and everything aligns +
  # installs into INSTALLROOT. On Linux find_package already finds the bits
  # Python, so this is a no-op there; gate it to Darwin to keep Linux unchanged.
  local _py=()
  [ "$(uname)" = Darwin ] && _py+=(
    -DPython_EXECUTABLE="${Python_ROOT}/bin/python3"
    -DPython3_EXECUTABLE="${Python_ROOT}/bin/python3"
  )
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
