package: uuid
description: libuuid universally unique identifier library
version: "1.42"
source: https://github.com/util-linux/util-linux
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/e2fsprogs-1.42.tar.gz
prefer_system: ".*"
prefer_system_check: |
  # Use the system libuuid when both header AND library are present -- compile *and link* a
  # test (a header-only check would wrongly pass hosts lacking the lib that Davix/xrootd
  # link with -luuid). On macOS uuid is in libSystem; e2fsprogs 1.42 won't build there.
  case $(uname) in
    Darwin) _uuid_libs="" ;;
    *)      _uuid_libs="-luuid" ;;
  esac
  printf '#include <uuid/uuid.h>\nint main(){ uuid_t u; uuid_generate(u); return 0; }\n' | cc -xc - $_uuid_libs -o /dev/null 2>&1
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
  # e2fsprogs builds static-only by default; libuuid.so needs --enable-elf-shlibs. Davix
  # and xrootd link $UUID_ROOT/lib/libuuid.so, so build it on Linux; macOS keeps the
  # static lib (no shared needed there).
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
  # e2fsprogs puts the built libraries in the top-level build lib/ (not lib/uuid/.libs):
  # with --enable-elf-shlibs, libuuid.so* plus SONAME symlinks and libuuid.a. (The old
  # lib/uuid/.libs path matched nothing and shipped an empty lib/.)
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
