package: meson
description: Meson fast and user-friendly software build system
version: "1.11.1"
source: https://github.com/mesonbuild/meson
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" .
}

function PostInstall() {
  # pip installs bin/meson with the bits Python shebang, but that interpreter lacks
  # MESON_ROOT's site-packages and bits only sources init.sh (not the module file)
  # for dependents, so mesonbuild is unimportable. Replace it with a PYTHONPATH-setting wrapper.
  cat > "${INSTALLROOT}/bin/meson" <<'EOF'
#!/bin/sh
_dir="$(cd "$(dirname "$0")/.." && pwd)"
_pyver=$(python3 -c 'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null)
export PYTHONPATH="${_dir}/lib/python${_pyver}/site-packages${PYTHONPATH:+:${PYTHONPATH}}"
exec python3 -m mesonbuild.mesonmain "$@"
EOF
  chmod 755 "${INSTALLROOT}/bin/meson"
}