package: gettext
description: GNU gettext internationalisation and localisation library
version: "1.0"
source: https://git.savannah.gnu.org/git/gettext.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
# On macOS use the Homebrew gettext instead of building from source (gnulib's
# strict iconv probe rejects macOS's system iconv, breaking the libtextstyle
# build). On Linux prefer_system does not match, so gettext is built as before.
prefer_system: "osx.*"
prefer_system_check: |
  #!/bin/bash -e
  # Homebrew gettext is keg-only; find its prefix and confirm libintl is usable.
  prefix=$(brew --prefix gettext 2>/dev/null) || prefix=/opt/homebrew/opt/gettext
  [ -n "$prefix" ] && [ -d "$prefix" ] || exit 1
  cc -x c - "-I${prefix}/include" -c -o /dev/null <<\EOF
  #include <libintl.h>
  int main(void) { return 0; }
  EOF
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --disable-relocatable: gnulib progreloc.c breaks under gcc15/C23 (bits uses a
  # fixed prefix); -std=gnu17 keeps gnulib gcc15-clean. macOS: gnulib's iconv probe
  # wrongly rejects system iconv (link error), so force am_cv_func_iconv_works=yes.
  _iconv_works=""
  bits_is_macos && _iconv_works="am_cv_func_iconv_works=yes"
  ./configure --prefix="$INSTALLROOT" \
    ${_iconv_works} \
    CFLAGS="${CFLAGS} -std=gnu17" \
    --disable-acl \
    --disable-csharp \
    --disable-curses \
    --disable-d \
    --disable-dependency-tracking \
    --disable-java \
    --disable-native-java \
    --disable-openmp \
    --disable-relocatable \
    --disable-rpath \
    --disable-silent-rules \
    --enable-nls \
    --enable-shared \
    --enable-static \
    --without-bzip2 \
    --without-emacs \
    --without-selinux \
    --without-xz
}
function MakeInstall() {
  make install-exec
}
