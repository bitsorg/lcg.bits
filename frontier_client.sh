package: Frontier_Client
description: Frontier conditions/calibration data access client
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/frontier_client__2.10.2__src.tar.gz
requires:
  - expat
  - pacparser
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - Frontier_Client-2.10.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # macOS ships no system OpenSSL headers (openssl/md5.h), so the build fails
  # with "'openssl/md5.h' file not found". The Frontier Makefile honours
  # OPENSSL_DIR (adds -I$OPENSSL_DIR/include and -L$OPENSSL_DIR/lib); point it at
  # Homebrew's keg-only openssl@3. On Linux OPENSSL_DIR stays unset and the build
  # picks up the system OpenSSL exactly as before (byte-identical).
  local openssl_dir="" make_extra=()
  if bits_is_macos; then
    openssl_dir=$(brew --prefix openssl@3 2>/dev/null) || openssl_dir=/opt/homebrew/opt/openssl@3
    if [ ! -f "$openssl_dir/include/openssl/md5.h" ]; then
      echo "Frontier_Client: Homebrew openssl@3 not found at $openssl_dir." >&2
      echo "Frontier_Client:   brew install openssl@3   (or re-run bits with --brew)" >&2
      exit 1
    fi
    # The Makefile ships a complete macOS dylib build path but auto-selects it
    # with `[ -f /usr/lib/libc.dylib ]`, a file that no longer exists on modern
    # macOS (dyld shared cache), so it falls back to the ELF .so path and emits
    # -Wl,-soname, which macOS ld rejects ("unknown options: -soname"). Force
    # DYLIBTYPE=dylib to take the -dynamiclib/-install_name path the Makefile
    # already implements. Also strip -lrt: there is no librt on macOS
    # (clock_gettime lives in libSystem). Both are macOS-only; Linux is untouched.
    make_extra+=(DYLIBTYPE=dylib)
    # The dylib's LC_ID_DYLIB is the bare name "libfrontier_client.X.Y.dylib";
    # bits' relocate-me.sh rewrites it to a long absolute store path via
    # install_name_tool. Without reserved header padding that rewrite fails
    # ("larger updated load commands do not fit"), which surfaces as
    # "Unpacking Frontier_Client: failed". Link with
    # -headerpad_max_install_names so the install name can grow.
    sed -i.bak \
      -e 's/ -lrt//g' \
      -e 's/-dynamiclib/-dynamiclib -headerpad_max_install_names/' \
      Makefile
  fi
  # Frontier_Client's Makefile has no parallel-safe dependency between the
  # http sub-make (which creates http/.libs) and the top-level libfrontier_client.so
  # target that needs it.  Force serial build to avoid the race.
  make dist \
    PACPARSER_DIR="${PACPARSER_ROOT}" \
    EXPAT_DIR="${EXPAT_ROOT}" \
    ${openssl_dir:+OPENSSL_DIR="$openssl_dir"} \
    "${make_extra[@]}"
}

function MakeInstall() {
  # 'make dist' populates a dist/ subdirectory with the install tree
  cp -a dist/. "$INSTALLROOT/"
}
