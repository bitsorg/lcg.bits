package: mysql
description: MySQL relational database server and client libraries
version: "10.11.16"
tag: "10.11.16"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mariadb-10.11.16.tar.gz
requires:
  - CMake
  - Boost
  - yacc-like
  - jemalloc
  - libevent
  - zlib
  - libxml2
  - lz4
  - zeromq
  - msgpackc
# macOS: source the MySQL client from Homebrew's keg-only `mysql-client`
# (provides mysql_config + libmysqlclient + headers). The only consumer that
# links it is conddbmysql; the client library ABI is backward-compatible, so the
# brew 9.x client works against the pinned 10.11 MariaDB server protocol.
# prefer_system gated osx.* so Linux keeps building MariaDB from source below.
prefer_system: "osx.*"
homebrew_formula: mysql-client
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix mysql-client >/dev/null 2>&1; then
    brew install mysql-client >&2 || true
  fi
  echo "bits_system_replace: mysql"
prefer_system_replacement_specs:
  mysql:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=mysql-client
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_DTRACE=0 \
    -DDOWNLOAD_BOOST=1 \
    -DWITH_BOOST="$SOURCEDIR/boost" \
    -DWITH_PCRE=bundled \
    -DMYSQL_MAINTAINER_MODE=OFF \
    ${LZ4_ROOT:+-DCMAKE_C_FLAGS="-I${LZ4_ROOT}/include" -DCMAKE_CXX_FLAGS="-I${LZ4_ROOT}/include"}
}
