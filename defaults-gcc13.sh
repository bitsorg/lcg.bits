package: defaults-gcc13
version: v1
overrides:
  GCC-Toolchain:
    prefer_system: (False) 
    source: https://github.com/alisw/gcc-toolchain
    tag: v13.2.0-alice1
append_arch: gcc13
---
