package: readline
description: GNU Readline (taken from the system / Homebrew; bits never builds it)
version: "system"
license: GPL-3.0-or-later
# Readline is never built by bits. The bits-built libreadline.so.8 left the
# terminfo globals (UP, BC, PC, ...) unresolved, so any program that loaded it
# via LD_LIBRARY_PATH during a build -- notably the gawk used in autoconf
# configure scripts -- crashed with "symbol lookup error: ... undefined symbol:
# UP", breaking unrelated packages (e.g. R). So:
#
#   * Linux: use the OS readline-devel package (default include / pkg-config
#     search paths). prefer_system_check succeeds with no replacement -> system
#     package, exactly as before.
#   * macOS: use the keg-only Homebrew readline. The check echoes a replacement
#     so the Homebrew prefix is symlinked into the install root via
#     HomebrewRecipe (downstream finds it through *_ROOT / PKG_CONFIG_PATH).
#     If the formula is missing the check installs it when `bits --brew` was
#     passed (BITS_BREW=1), otherwise it fails and the recipe body below prints
#     how to install it.
prefer_system: ".*"
# Marks readline as Homebrew-sourced so `bits brew` lists it in the generated
# Brewfile. The formula name happens to equal the package name, so HomebrewRecipe
# picks it up by default and the replacement body need not set HOMEBREW_FORMULA.
homebrew_formula: readline
prefer_system_check: |
  #!/bin/bash
  case "$(uname)" in
    Darwin)
      # Homebrew readline is keg-only; find its prefix and confirm the headers.
      prefix=$(brew --prefix readline 2>/dev/null) || prefix=/opt/homebrew/opt/readline
      if [ ! -e "${prefix}/include/readline/readline.h" ]; then
        if [ "${BITS_BREW:-}" = "1" ]; then
          echo "readline: not found; installing with Homebrew (bits --brew)..." >&2
          brew install readline >&2 || exit 1
        else
          # Not installed and no --brew: fail. The recipe body prints guidance.
          exit 1
        fi
      fi
      echo "bits_system_replace: readline"
      ;;
    *)
      # Linux: dev package on the default include / pkg-config paths. Success
      # with no replacement line -> bits uses the system readline.
      pkg-config --exists readline 2>/dev/null && exit 0
      [ -e /usr/include/readline/readline.h ] && exit 0
      exit 1
      ;;
  esac
prefer_system_replacement_specs:
  readline:
    version: "homebrew"
    build_requires:
      - bits-recipe-tools
    recipe: |
      #!/bin/bash -e
      MODULE_OPTIONS="--lib --inc --pkgconfig"
      . $(bits-include HomebrewRecipe)
---
#!/bin/bash -e
# Reached only when prefer_system_check could not satisfy readline (Linux without
# the dev package, or macOS without Homebrew readline and without `bits --brew`).
# There is no buildable fallback (a bits-built readline breaks gawk/configure), so
# fail with actionable guidance instead of installing a broken library.
echo "ERROR: readline development files were not found." >&2
case "$(uname)" in
  Darwin)
    echo "  Install it with:  brew install readline" >&2
    echo "  or re-run bits with --brew to install it automatically." >&2
    ;;
  *)
    echo "  Install the system readline development package, e.g." >&2
    echo "    RHEL/Alma:  dnf install readline-devel" >&2
    echo "    Ubuntu:     apt install libreadline-dev" >&2
    ;;
esac
exit 1
