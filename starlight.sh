package: starlight
description: STARlight Monte Carlo for coherent photoproduction at colliders
version: "r330"
tag: "r330"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/starlight-r330.tgz
requires:
  - hepmc3
  - dpmjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-STARLIGHT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_FLAGS="-Wno-array-parameter -Wno-unused-but-set-variable -Wno-unknown-warning-option" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_HEPMC3=ON \
    -DENABLE_DPMJET=ON \
    -DBUILD_SHARED_LIB=ON \
    ${HEPMC3_ROOT:+-DHepMC3_DIR=$HEPMC3_ROOT} \
    ${DPMJET_ROOT:+-DDPMJET_DIR=$DPMJET_ROOT}
}
function PostInstall() {
  # Copy config and headers not installed by CMake
  [[ -d "$SOURCEDIR/config" ]] && cp -r "$SOURCEDIR/config" "$INSTALLROOT"/
  [[ -d "$SOURCEDIR/include" ]] && cp -r "$SOURCEDIR/include" "$INSTALLROOT"/
  # Prefix macros in headers to avoid clashes
  if [[ -d "$INSTALLROOT/include" ]]; then
    sed -i 's/printInfo/starlight_printInfo/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
    sed -i 's/printWarn/starlight_printWarn/g' "$INSTALLROOT"/include/*.h 2>/dev/null || true
    sed -i 's/printErr/starlight_printErr/g'   "$INSTALLROOT"/include/*.h 2>/dev/null || true
  fi
  # Write starlight-config helper script
  mkdir -p "$INSTALLROOT/bin"
  printf '#!/bin/sh\necho %s\n' "$INSTALLROOT" > "$INSTALLROOT/bin/starlight-config"
  chmod +x "$INSTALLROOT/bin/starlight-config"
  # Extend modulefile
  printf 'setenv STARLIGHT_ROOT $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
