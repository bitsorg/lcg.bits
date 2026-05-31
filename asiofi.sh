package: asiofi
description: asiofi FairMQ async transport based on Asio
version: "0.5.1"
tag: "0.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - asio
  - ofi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # asiofi configure builds a bundled FairCMakeModules via a nested cmake
  # invocation (cmake/asiofiBundlePackageHelper.cmake).  That sub-project sets a
  # cmake_minimum_required below 3.5, which CMake 3.30 now rejects, so the nested
  # build exits 1 ("Building bundled FairCMakeModules" -> error).  Export the
  # compatibility floor so the nested cmake (which inherits the environment)
  # accepts the old minimum.  NOTE: confirm against build/extern/FairCMakeModules/
  # build.log; if the failure is different this will need revisiting.
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DBUILD_SHARED_LIBS=ON
}
