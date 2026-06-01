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
  # asiofi vendors FairCMakeModules as a GIT SUBMODULE (extern/FairCMakeModules)
  # and, when find_package(FairCMakeModules) fails, falls back to building that
  # bundled copy (cmake/asiofiBundlePackageHelper.cmake -> build_bundled). Built
  # from a source tarball the submodule directory is EMPTY (submodules are not
  # shipped in tarballs), so the bundle's git step fails:
  #   error: pathspec '.../extern/FairCMakeModules' did not match any file(s)
  # The real fix is to make an external FairCMakeModules discoverable so the
  # bundle path is never taken (see the faircmakemodules dependency). The policy
  # floor below is still exported because FairCMakeModules' own cmake predates
  # the CMake>=4 minimum.
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DBUILD_SHARED_LIBS=ON
}
