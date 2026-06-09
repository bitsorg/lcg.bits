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
  #
  # macOS: starlight's CMakeLists does `set(CMAKE_CXX_FLAGS "-Wall -Wextra
  # -Werror ...")` (overwrite, not append), so the -DCMAKE_CXX_FLAGS passed below
  # is clobbered and cannot relax warnings. Apple clang then errors on warnings
  # gcc never emits (e.g. C++ variable-length arrays, -Wvla-cxx-extension, in
  # inputParser.cpp / starlightStandalone.cpp). Strip -Werror from the CMakeLists
  # so those stay warnings. Linux keeps -Werror (gcc doesn't trip on this code).
  [ "$(uname)" = Darwin ] && perl -i -pe 's/ -Werror\b//g' "${SOURCEDIR}/CMakeLists.txt"
  # macOS: starlight links HepMC3 only into the `starlight` executable
  # (target_link_libraries(starlight ... ${optionalLibs})), but hepmc3writer.cpp
  # is compiled into libStarlib, which is never linked against libHepMC3. Linux's
  # flat namespace leaves those HepMC3:: symbols undefined in the .so and resolves
  # them at load time (the executable pulls in HepMC3); macOS's two-level
  # namespace rejects them at link ("Undefined symbols ... HepMC3::GenEvent...").
  # Allow dynamic_lookup so the dylib link tolerates them, matching Linux; the
  # executable still links HepMC3 so they resolve at run. -headerpad lets bits'
  # post-build install_name_tool relocation rewrite the long install path.
  local _lflags=()
  [ "$(uname)" = Darwin ] && _lflags=(-DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names")
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-array-parameter -Wno-unused-but-set-variable -Wno-unknown-warning-option -Wno-vla-cxx-extension" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_HEPMC3=ON \
    -DBUILD_SHARED_LIB=ON \
    "${_lflags[@]}" \
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
