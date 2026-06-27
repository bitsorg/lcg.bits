package: uuid
description: libuuid universally unique identifier library
version: "1.42"
tag: "1.42"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/e2fsprogs-1.42.tar.gz
prefer_system: ".*"
prefer_system_check: |
  # Use the system libuuid when both the header AND the library are present —
  # e.g. RHEL/Alma libuuid-devel, Debian/Ubuntu uuid-dev. Compile *and link* a
  # tiny program: a header-only check would wrongly accept hosts that lack the
  # library, which is precisely the failure this guards against (Davix/xrootd link
  # -luuid). On macOS there is no separate -luuid (uuid lives in libSystem), so
  # this fails and bits builds uuid from source, as before.
  printf '#include <uuid/uuid.h>\nint main(){ uuid_t u; uuid_generate(u); return 0; }\n' | cc -xc - -luuid -o /dev/null 2>&1
  if [ $? -ne 0 ]; then
    printf "libuuid not found.\n * On RHEL/Alma-compatible systems install: libuuid libuuid-devel\n * On Debian/Ubuntu-compatible systems install: uuid-dev\n"
    exit 1
  fi

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--lib --inc --pkgconfig"
##############################
function Configure() {
  # e2fsprogs builds STATIC-ONLY by default ("Disabling ELF shared libraries by
  # default"); libuuid.so is only produced with --enable-elf-shlibs. Davix and
  # xrootd link against $UUID_ROOT/lib/libuuid.so, so we must build it on Linux.
  # macOS keeps the static lib (the BSD-shlib path isn't needed there).
  case $(uname) in
    Darwin) SHLIB_OPTS="--disable-shared" ;;
    *)      SHLIB_OPTS="--enable-elf-shlibs" ;;
  esac
  # Avoid building docs
  GTKDOCIZE=echo autoreconf -ivf
  ./configure $SHLIB_OPTS \
    "--libdir=$INSTALLROOT/lib" \
    "--prefix=$INSTALLROOT" \
    --disable-all-programs \
    --disable-silent-rules \
    --disable-tls \
    --disable-nls \
    --disable-rpath \
    --without-ncurses \
    --enable-libuuid
}
function Make() {
  # e2fsprogs builds uuid inside lib/uuid; there is no top-level libuuid.la target.
  make ${JOBS:+-j $JOBS} -C lib/uuid
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/lib" "$INSTALLROOT/share/pkgconfig" "$INSTALLROOT/include/uuid"
  cp -a lib/uuid/uuid.pc "$INSTALLROOT/share/pkgconfig" 2>/dev/null || true
  # e2fsprogs places the built libraries in the TOP-LEVEL build lib/ (not
  # lib/uuid/.libs); with --enable-elf-shlibs that is libuuid.so* + its SONAME
  # symlinks alongside libuuid.a. (The previous lib/uuid/.libs path matched
  # nothing, so an empty lib/ was shipped silently.)
  case $(uname) in
    Darwin) cp -a lib/libuuid.a "$INSTALLROOT/lib/" ;;
    *)      cp -a lib/libuuid.so* lib/libuuid.a "$INSTALLROOT/lib/" ;;
  esac
  # Install uuid headers (e2fsprogs 1.42 lib/uuid/Makefile has no automake
  # install-uuidincHEADERS target; uuid.h is generated during Make() via "CP uuid.h").
  cp -a lib/uuid/uuid.h "$INSTALLROOT/include/uuid/"
  # Fail loudly rather than ship an empty lib/: downstreams (Davix, xrootd) link
  # against libuuid here, and a missing lib otherwise surfaces only as a confusing
  # "No rule to make target .../libuuid.so" much later in their link step.
  ls "$INSTALLROOT"/lib/libuuid.* >/dev/null
}
