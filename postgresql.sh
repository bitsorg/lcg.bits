package: postgresql
description: PostgreSQL open-source relational database system
version: "17.5"
tag: "17.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - yacc-like
  - m4
  - pkg_config
  - gettext
# macOS: source PostgreSQL from Homebrew's keg-only `libpq` (client library:
# libpq + pg_config + headers + psql). The only consumer is libpqxx, which needs
# just the client library; libpq's API is backward-compatible, so the brew 18.x
# client works against the pinned 17.5 server protocol. prefer_system gated osx.*
# so Linux keeps building the full PostgreSQL from source below.
prefer_system: "osx.*"
homebrew_formula: libpq
prefer_system_check: |
  #!/bin/bash
  # Only runs on macOS (osx.* gate). Install on demand with `bits --brew`;
  # otherwise HomebrewRecipe reports the missing formula at build time.
  if [ "${BITS_BREW:-}" = "1" ] && ! brew --prefix libpq >/dev/null 2>&1; then
    brew install libpq >&2 || true
  fi
  echo "bits_system_replace: postgresql"
prefer_system_replacement_specs:
  postgresql:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--bin --lib --pkgconfig"
      HOMEBREW_FORMULA=libpq
      . $(bits-include HomebrewRecipe)
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: PostgreSQL
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # --without-readline: the bits readline.so has an unresolved ncurses 'UP'
  # symbol that crashes gawk during configure probes; readline is only used
  # by the psql interactive client and is not needed for the server libraries.
  ./configure --prefix="$INSTALLROOT" \
    --without-icu \
    --without-readline \
    --with-gettext="${GETTEXT_ROOT}" \
    --enable-thread-safety
}
