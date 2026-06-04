package: elfutils
description: elfutils libdw/libelf (used from the system; bits never builds it)
version: "system"
license: GPL-2.0-or-later
# elfutils (libdw/libelf) is taken from the system -- bits never builds it.
# heaptrack's interpret tool needs libdw >= 0.158 and finds it through the
# system compiler/pkg-config search paths. Declaring it as a system_requirement
# turns a cryptic mid-build "Could NOT find Elfutils (missing LIBDW_LIBRARIES
# LIBDW_INCLUDE_DIR)" cmake failure into an upfront, actionable message.
system_requirement_missing: |
  System elfutils development files (libdw) not found.
    * Install the system elfutils development package, e.g.
        RHEL/Alma:  dnf install elfutils-devel
        Ubuntu:     apt install libdw-dev libelf-dev
system_requirement: ".*"
system_requirement_check: |
  pkg-config --exists libdw 2>/dev/null || [ -e /usr/include/elfutils/libdw.h ]
---
