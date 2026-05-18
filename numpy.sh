package: numpy
description: NumPy fundamental package for array computing in Python
version: "2.4.0"
tag: "2.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numpy-2.4.0.tar.gz
requires:
  - Python
  - setuptools
  - blas
  - cython
  - pip
  - meson
  - meson_python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
[ "$(uname -m)" = "aarch64" ] && export CFLAGS="${CFLAGS:-} -O0"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"

function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "$SOURCEDIR"/ ./
  # numpy 2.4.0 bundles a Highway version whose float16_t increment, decrement,
  # and compound-assignment operators are incorrectly marked 'const' while
  # modifying the 'native' data member.  GCC 14+ correctly rejects this.
  # Remove the erroneous 'const' qualifiers from those specific operators.
  "${PYTHON_EXE}" -c "
import re, sys
f = 'numpy/_core/src/highway/hwy/base.h'
try:
    t = open(f).read()
except FileNotFoundError:
    print('hwy/base.h not found, skipping patch', file=sys.stderr)
    sys.exit(0)
# operator++/-- returning float16_t or float16_t& that mutate 'native'
t = re.sub(r'(constexpr float16_t[& ]+operator[+\-]{1,2}\([^)]*\))\s+const\b',
           r'\1', t)
# HWY_FLOAT16_BINARY_OP macro: assign_name variants return float16_t& and mutate
t = re.sub(r'(float16_t&\s+assign_name\([^)]*\))\s+const\b',
           r'\1', t)
open(f, 'w').write(t)
print('Patched hwy/base.h: removed const from float16_t mutating operators')
" >&2
}

function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  local _pip_extra=""
  [ "$(uname -s)" = "Darwin" ] && _pip_extra="-Csetup-args=-Dblas=openblas -Csetup-args=-Dlapack=openblas"
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" ${_pip_extra} .
}
##############################
