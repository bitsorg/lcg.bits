package: readline
description: GNU Readline (taken from the system / Homebrew; bits never builds it)
version: "system"
license: GPL-3.0-or-later
# Never built by bits: a bits-built libreadline left terminfo globals (UP, BC, ...)
# unresolved, crashing gawk/configure (and packages like R). Use system readline-devel
# (Linux) or keg-only Homebrew readline (macOS, via HomebrewRecipe; on --brew/BITS_BREW=1).
prefer_system: ".*"
# Marks readline as Homebrew-sourced for `bits brew`. Formula name equals the
# package name, so HomebrewRecipe picks it up by default (no HOMEBREW_FORMULA).
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
# Reached only when prefer_system_check could not satisfy readline. No buildable
# fallback (a bits-built readline breaks gawk/configure), so fail with guidance.
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
