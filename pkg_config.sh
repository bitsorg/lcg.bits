package: pkg_config
description: pkg-config helper tool for querying library compile/link flags
version: "0.29.2"
tag: "0.29.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pkg-config-0.29.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
patches:
  - pkg_config-0.29.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
. $(bits-include BitsArch)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Determine the multiarch triple so the compiled-in PC_PATH includes the
  # Ubuntu multiarch pkgconfig directory (e.g. /usr/lib/x86_64-linux-gnu/pkgconfig).
  # Without this, bits-built pkg-config silently misses .pc files installed by
  # system packages (those built with prefer_system), forcing every recipe that
  # depends on a system package to carry ad hoc PKG_CONFIG_PATH workarounds.
  # /usr/lib64/pkgconfig is added for RHEL/CentOS compatibility; non-existent
  # paths are silently ignored by pkg-config.
  local _triple
  _triple=$(bits_triple)
  # macOS/Xcode 16 clang promotes -Wint-conversion (and implicit function
  # declarations) to hard errors, which breaks pkg-config's vendored glib 2.x
  # (gatomic.c: "incompatible integer to pointer conversion passing 'gsize' to
  # 'gpointer'"). Downgrade those two to warnings so --with-internal-glib still
  # compiles. No effect on Linux/gcc.
  bits_is_macos && export CFLAGS="${CFLAGS:+$CFLAGS }-Wno-error=int-conversion -Wno-error=implicit-function-declaration"
  ./configure --with-internal-glib --prefix=$INSTALLROOT \
    --with-system-include-path=/usr/include \
    --with-pc-path="/usr/lib/${_triple}/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig"
}
