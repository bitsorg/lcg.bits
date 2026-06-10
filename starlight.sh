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
  # Built standalone (DPMJet disabled, matching lcgcmake): the bundled flat
  # DPMJet 3.0-6 .f files lack the DPMJET-III include layout -DENABLE_DPMJET wants.
  # macOS: CMakeLists adds -Werror, clobbering our flags; strip it so Apple
  # clang's C++-VLA warnings (gcc never emits these) stay warnings.
  bits_is_macos && bits_strip_token "${SOURCEDIR}/CMakeLists.txt" -Werror
  # macOS: hepmc3writer.cpp goes into libStarlib but HepMC3 links only into the
  # executable, so the .so has undefined HepMC3:: symbols; allow them (dynamic_lookup).
  local _lf; _lf=$(bits_macos_undefined_ldflags)
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-array-parameter -Wno-unused-but-set-variable -Wno-unknown-warning-option -Wno-vla-cxx-extension" \
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
  # Prefix macros in headers to avoid clashes
  if [[ -d "$INSTALLROOT/include" ]]; then
    perl -i -pe 's/printInfo/starlight_printInfo/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
    perl -i -pe 's/printWarn/starlight_printWarn/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
    perl -i -pe 's/printErr/starlight_printErr/g'   "$INSTALLROOT"/include/*.h 2>/dev/null || true
  fi
  # Write starlight-config helper script
  mkdir -p "$INSTALLROOT/bin"
  printf '#!/bin/sh\necho %s\n' "$INSTALLROOT" > "$INSTALLROOT/bin/starlight-config"
  chmod +x "$INSTALLROOT/bin/starlight-config"
  # Extend modulefile
  printf 'setenv STARLIGHT_ROOT $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
