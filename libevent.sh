package: libevent
description: libevent asynchronous event notification library
version: "2.1.11"
tag: "2.1.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: libevent's extra / pthreads / openssl sub-libraries reference
  # libevent_core symbols without linking core. Linux (ELF) resolves these at
  # load time, but macOS's two-level namespace rejects undefined symbols in a
  # dylib ("Undefined symbols for architecture arm64: _event_pending,
  # _evthread_lock_fns_, _evutil_closesocket, ..."). Allow flat-namespace lazy
  # resolution so the sub-dylibs link, matching the ELF behaviour.
  [ "$(uname)" = Darwin ] && export LDFLAGS="-Wl,-undefined,dynamic_lookup${LDFLAGS:+ ${LDFLAGS}}"
  ./configure --prefix $INSTALLROOT
}
