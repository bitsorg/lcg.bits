package: starlight
description: STARlight Monte Carlo for coherent photoproduction at colliders
version: "r330"
tag: "r330"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tgz
requires:
  - CMake
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-STARLIGHT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Built standalone (DPMJet disabled), matching lcgcmake's Starlight recipe.
  # starlight r330's optional DPMJet interface (dpmjet/dpmjetint.f) does
  # INCLUDE 'inc/dtflka' and expects the modern DPMJET-III layout with separate
  # Fortran include files under include/dpmjet/inc/.  The DPMJet 3.0-6 tarball
  # bits builds is a flat set of monolithic .f files with no such headers, so
  # -DENABLE_DPMJET=ON cannot compile.  lcgcmake never enables this combination.
  # macOS: CMakeLists adds -Werror, clobbering our flags; strip it (patch the
  # build COPY, not read-only $SOURCEDIR) so Apple clang's C++-VLA warnings stay
  # warnings. Also add -Wno-vla-cxx-extension and allow undefined HepMC3:: symbols
  # in libStarlib (hepmc3writer.cpp) via dynamic_lookup.
  local _cxx="-Wno-array-parameter -Wno-unused-but-set-variable -Wno-unknown-warning-option"
  local _lf=""
  if bits_is_macos; then
    bits_strip_token "${BITS_CMAKE_SRC}/CMakeLists.txt" -Werror
    _cxx="$_cxx -Wno-vla-cxx-extension"
    _lf=$(bits_macos_undefined_ldflags)
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$_cxx" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_HEPMC3=ON \
    -DBUILD_SHARED_LIB=ON \
    ${_lf:+-DCMAKE_SHARED_LINKER_FLAGS="$_lf"} \
    ${HEPMC3_ROOT:+-DHepMC3_DIR="$HEPMC3_ROOT"}
}
function PostInstall() {
  # Copy config and headers not installed by CMake
  [[ -d "$SOURCEDIR/config" ]] && cp -r "$SOURCEDIR/config" "$INSTALLROOT"/
  [[ -d "$SOURCEDIR/include" ]] && cp -r "$SOURCEDIR/include" "$INSTALLROOT"/
  # Prefix macros in headers to avoid clashes. macOS: BSD sed -i needs a suffix
  # arg, so use perl -i there; Linux keeps sed.
  if [[ -d "$INSTALLROOT/include" ]]; then
    if bits_is_macos; then
      perl -i -pe 's/printInfo/starlight_printInfo/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
      perl -i -pe 's/printWarn/starlight_printWarn/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
      perl -i -pe 's/printErr/starlight_printErr/g'   "$INSTALLROOT"/include/*.h 2>/dev/null || true
    else
      sed -i 's/printInfo/starlight_printInfo/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
      sed -i 's/printWarn/starlight_printWarn/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
      sed -i 's/printErr/starlight_printErr/g'   "$INSTALLROOT"/include/*.h 2>/dev/null || true
    fi
  fi
  # Write starlight-config helper script
  mkdir -p "$INSTALLROOT/bin"
  printf '#!/bin/sh\necho %s\n' "$INSTALLROOT" > "$INSTALLROOT/bin/starlight-config"
  chmod +x "$INSTALLROOT/bin/starlight-config"
  # Extend modulefile
  printf 'setenv STARLIGHT_ROOT $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
