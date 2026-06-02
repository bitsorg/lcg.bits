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
# compiler/pkg-config search paths.
system_requirement_missing: |
  System readline development files not found.
    * Install the system readline development package, e.g.
        RHEL/Alma:  dnf install readline-devel
        Ubuntu:     apt install libreadline-dev
system_requirement: ".*"
system_requirement_check: |
  pkg-config --exists readline 2>/dev/null || [ -e /usr/include/readline/readline.h ]
---
