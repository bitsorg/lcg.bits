package: readline
description: GNU Readline (used from the system; bits never builds it)
version: "system"
license: GPL-3.0-or-later
# Readline is taken from the system -- bits never builds it. The bits-built
# libreadline.so.8 left the terminfo globals (UP, BC, PC, ...) unresolved, so any
# program that loaded it via LD_LIBRARY_PATH during a build -- notably the gawk
# used in autoconf configure scripts -- crashed with
# "symbol lookup error: ... undefined symbol: UP", breaking unrelated packages
# (e.g. R). Using the OS readline avoids polluting LD_LIBRARY_PATH with a broken
# library. If a consumer needs it, the system readline is found in the default
# compiler/pkg-config search paths (on macOS it is keg-only under the Homebrew
# prefix, e.g. /opt/homebrew/opt/readline).
system_requirement_missing: |
  System readline development files not found.
    * Install the system readline development package, e.g.
        RHEL/Alma:  dnf install readline-devel
        Ubuntu:     apt install libreadline-dev
        macOS:      brew install readline   (keg-only; bits looks under the
                    Homebrew prefix, e.g. /opt/homebrew/opt/readline)
system_requirement: ".*"
system_requirement_check: |
  # Linux: dev package on the default include / pkg-config paths.
  pkg-config --exists readline 2>/dev/null && exit 0
  [ -e /usr/include/readline/readline.h ] && exit 0
  # macOS: Homebrew readline is keg-only (not symlinked into the default include
  # path), so also look under its Homebrew prefix.
  for _p in "$(brew --prefix readline 2>/dev/null)" \
            /opt/homebrew/opt/readline /usr/local/opt/readline; do
    [ -n "${_p}" ] && [ -e "${_p}/include/readline/readline.h" ] && exit 0
  done
  exit 1
---
