#!/usr/bin/env python3
"""
Convert lcgcmake recipes to bits recipe format.

Parses:
  - cmake/toolchain/heptools-*.cmake  → package name, version, optional GIT url
  - externals, generators, frameworks, projects, key4hep, gridexternals, contrib CMakeLists.txt
    → LCGPackage_Add blocks with build instructions
  - pyexternals CMakeLists.txt → pip-install recipes

Outputs one .sh file per package into repos/lcg.bits/
"""

import re
import os
import glob
import textwrap

LCGCMAKE = "/sessions/wonderful-pensive-babbage/mnt/bits/repos/lcgcmake"
OUTPUT_DIR = "/sessions/wonderful-pensive-babbage/mnt/bits/repos/lcg.bits"
GEN_URL = "https://lcgpackages.web.cern.ch/tarFiles/sources"
GEN_URL_MC = "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles"

os.makedirs(OUTPUT_DIR, exist_ok=True)

# ---------------------------------------------------------------------------
# Known descriptions for common packages
# ---------------------------------------------------------------------------
DESCRIPTIONS = {
    "absl": "Abseil Google C++ common libraries",
    "acts": "ACTS track reconstruction framework for HEP experiments",
    "aida": "Abstract Interfaces for Data Analysis (HEP histogram/tree interface)",
    "alpaka": "Alpaka abstraction library for parallel kernel acceleration",
    "ant": "Apache Ant Java build tool",
    "armadillo": "Armadillo C++ linear algebra library",
    "arrow": "Apache Arrow cross-language columnar in-memory data format",
    "assimp": "Open Asset Import Library for 3D model formats",
    "autoconf": "GNU Autoconf automatic configure script generator",
    "automake": "GNU Automake Makefile generator",
    "bison": "GNU Bison general-purpose parser generator",
    "binutils": "GNU Binutils binary tools (assembler, linker, objdump, etc.)",
    "blas": "Basic Linear Algebra Subprograms reference implementation",
    "blosc": "Blosc high-performance meta-compressor",
    "boost": "Boost C++ portable peer-reviewed libraries",
    "brotli": "Brotli lossless data compression algorithm",
    "bzip2": "bzip2 lossless data compression library",
    "c_ares": "Asynchronous DNS resolver library",
    "cairo": "2D vector graphics library with multiple output backends",
    "catch2": "Modern C++ unit-testing framework",
    "ccache": "Compiler cache to speed up recompilation",
    "cfitsio": "C library for reading and writing FITS files",
    "cgal": "Computational Geometry Algorithms Library",
    "clhep": "Class Library for High Energy Physics",
    "cln": "Class Library for Numbers (CLN) arbitrary precision arithmetic",
    "cmake": "Cross-platform build system generator",
    "cmaketools": "CMake utility scripts and helper modules for LCG builds",
    "coin3d": "Coin3D Open Inventor 3D graphics scene graph library",
    "contur": "Contur constraints on new physics from LHC measurements",
    "cppcheck": "Static analysis tool for C/C++ code",
    "cppgsl": "C++ Guidelines Support Library (Microsoft GSL implementation)",
    "cppunit": "C++ unit testing framework (port of JUnit)",
    "cppzmq": "Header-only C++ binding for ZeroMQ",
    "curl": "Command-line tool and library for URL data transfer",
    "davix": "Davix high-performance data access library for HTTP/WebDAV/S3",
    "dcap": "dCache access protocol (DCAP) client library",
    "dd4hep": "Detector Description for HEP (generic detector description toolkit)",
    "delphes": "Delphes fast detector simulation framework",
    "double_conversion": "Binary-decimal and decimal-binary conversion routines for IEEE doubles",
    "edm4hep": "Event Data Model for High Energy Physics (Key4hep framework)",
    "evtgen": "Monte Carlo event generator for B-meson and other particle decays",
    "expat": "Expat XML parsing library",
    "fastjet": "Package for jet finding in hadron and e+e- collisions",
    "feynhiggs": "FeynHiggs Higgs boson mass and mixing calculations in MSSM",
    "fftw3": "Fastest Fourier Transform in the West (FFTW) version 3",
    "fjcontrib": "FastJet Contrib package of jet substructure tools and plugins",
    "flatbuffers": "Memory-efficient cross-platform serialization library",
    "flex": "Flex fast lexical analyser generator",
    "fmt": "Modern C++ string formatting library ({fmt})",
    "fontconfig": "Library for font configuration and customization",
    "freeglut": "Open-source implementation of the GLUT OpenGL Utility Toolkit",
    "freetype": "FreeType font rendering library",
    "gaudi": "Gaudi software framework for HEP data processing applications",
    "gcc": "GNU Compiler Collection (C, C++, Fortran)",
    "geant4": "Geant4 Monte Carlo particle transport simulation toolkit",
    "geant4_vmc": "Geant4 Virtual Monte Carlo interface",
    "gettext": "GNU gettext internationalization and localization library",
    "gflags": "Google command-line flags parsing library",
    "ginac": "GiNaC open framework for symbolic computation",
    "gl2ps": "OpenGL to PostScript/PDF/SVG printing library",
    "glog": "Google C++ logging library",
    "gmp": "GNU Multiple Precision Arithmetic Library",
    "googlebenchmark": "Google C++ microbenchmarking support library",
    "googletest": "Google C++ testing and mocking framework (gtest/gmock)",
    "gperf": "GNU gperf perfect hash function generator",
    "gsl": "GNU Scientific Library for numerical computations",
    "harfbuzz": "Text shaping engine",
    "hdf5": "HDF5 high-performance data management and storage library",
    "hepmc": "HepMC Monte Carlo event record (version 2)",
    "hepmc3": "HepMC3 Monte Carlo event record library",
    "heppdt": "HEP Particle Data Table library",
    "heputils": "HepUtils lightweight HEP physics utilities",
    "herwig": "Herwig Monte Carlo event generator for high-energy collisions",
    "herwig3": "Herwig 7 Monte Carlo event generator",
    "hijing": "HIJING Monte Carlo model for heavy-ion and pp collisions",
    "jemalloc": "General-purpose scalable concurrent memory allocator",
    "jsoncpp": "C++ library for JSON reading and writing",
    "kfparticle": "KFParticle particle reconstruction and decay vertex finding library",
    "lapack": "LAPACK linear algebra package",
    "lcgenv": "LCG software environment setup and shell integration tool",
    "lcio": "LCIO (Linear Collider I/O) event data model and persistence library",
    "lhapdf": "LHAPDF parton density function interpolation library",
    "lhapdf5": "LHAPDF5 legacy parton density function interpolation library",
    "libtool": "GNU Libtool generic shared library support script",
    "libxml2": "GNOME XML parsing library",
    "libxslt": "GNOME XSLT processing library",
    "lz4": "Extremely fast lossless compression algorithm and library",
    "lzma": "LZMA/XZ lossless data compression library",
    "m4": "GNU M4 general-purpose macro processor",
    "mcfm": "MCFM Monte Carlo for FeMtobarn processes",
    "mcutils": "MCUtils Monte Carlo event analysis utilities",
    "mpfr": "GNU MPFR multiple-precision floating-point arithmetic library",
    "nlox": "NLox NLO QCD library for loop amplitudes",
    "openblas": "Optimized BLAS library based on GotoBLAS2",
    "openloops": "OpenLoops one-loop matrix element generator",
    "pandorapfa": "PandoraPFA multi-algorithm particle flow reconstruction",
    "pcre": "Perl Compatible Regular Expressions library",
    "pcre2": "Perl Compatible Regular Expressions library (version 2)",
    "pixman": "Pixel manipulation library for X and Cairo",
    "podio": "Plain Old Data I/O library for HEP event data models",
    "protobuf": "Google Protocol Buffers serialization library",
    "pythia6": "Pythia 6 Monte Carlo event generator (legacy Fortran version)",
    "pythia8": "Pythia 8 Monte Carlo event generator for high-energy physics",
    "python": "CPython interpreter and standard library",
    "qt": "Qt cross-platform application and UI framework",
    "rangev3": "Range library for C++14/17/20 (Eric Niebler's range-v3)",
    "rapidjson": "Fast C++ JSON parser and generator library",
    "re2": "Fast, safe, thread-friendly regular expression library",
    "rivet": "Rivet Monte Carlo analysis toolkit",
    "root": "CERN ROOT data analysis framework",
    "sherpa": "Sherpa multi-purpose Monte Carlo event generator",
    "sio": "SIO simple sequential I/O library for Key4hep",
    "snappy": "Fast compressor/decompressor (Snappy)",
    "sqlite": "SQLite self-contained SQL database engine library",
    "tbb": "Intel Threading Building Blocks parallel programming library",
    "thepeg": "ThePEG Toolkit for High Energy Physics Event Generation",
    "thrift": "Apache Thrift scalable cross-language RPC framework",
    "uuid": "DCE compatible Universally Unique Identifier library",
    "valgrind": "Valgrind dynamic analysis framework for memory and threading",
    "vecgeom": "VecGeom vectorized geometry library for particle transport",
    "xercesc": "Apache Xerces-C++ XML parser library",
    "xrootd": "XRootD high-performance scalable data access framework",
    "xxhash": "xxHash extremely fast non-cryptographic hash algorithm",
    "yamlcpp": "yaml-cpp YAML parser and emitter library for C++",
    "yoda": "YODA Yet more Objects for Data Analysis HEP histogramming library",
    "zeromq": "ZeroMQ high-performance asynchronous messaging library",
    "zlib": "zlib lossless data compression library",
    "zstd": "Zstandard fast real-time compression algorithm",
    "opendatadetector": "Open Data Detector generic tracking detector geometry",
    "simsipm": "SimSiPM Silicon Photomultiplier simulation library",
    "pandorasdk": "PandoraSDK Software Development Kit for Pandora pattern recognition",
    "pandoramonitoring": "PandoraMonitoring monitoring and display for Pandora algorithms",
    "larcontent": "LArContent Liquid Argon TPC reconstruction algorithms for Pandora",
    "garfield": "Garfield++ toolkit for simulation of detectors using ionization gases",
    "acts_dd4hep": "ACTS DD4hep plugin for detector description integration",
    "geant4_vecgeom_scalar": "Geant4 build with VecGeom scalar geometry",
    "freeimage": "FreeImage open source image library",
    "dcap": "dCache access protocol (DCAP) client library",
    "dm_util": "dCache management utilities",
    "epel": "Extra Packages for Enterprise Linux (EPEL) repository setup",
    "lb": "LHCb build tool binary package",
    "binutils": "GNU Binutils binary tools (assembler, linker, nm, etc.)",
    "hepmc3": "HepMC3 Monte Carlo event record library",
    "gosam": "GoSam automated one-loop amplitudes generator",
    "herwig3": "Herwig 7 next-to-leading order Monte Carlo event generator",
    "lhapdfsets": "LHAPDF6 PDF data sets (parton distribution function grids)",
    "lhapdf6sets": "LHAPDF6 minimal PDF sets for validation",
    "agile": "AGILe Automated General Interface for Legacy Experiments",
    "alpgen": "ALPGEN LO multi-parton matrix element generator",
    "yoda": "YODA Yet more Objects for Data Analysis (HEP histogramming)",
    "contur": "Contur automated constraints from LHC measurements",
    "protos": "PROTOS top quark anomalous couplings generator",
    "mcfm": "MCFM Monte Carlo for FeMtobarn processes",
    "ggvvamp": "ggvvamp loop amplitude library for gg→VV processes",
    "qqvvamp": "qqvvamp loop amplitude library for qq→VV processes",
    "mcutils": "MCUtils Monte Carlo event analysis utilities",
    "heputils": "HepUtils lightweight HEP physics analysis utilities",
}

# ---------------------------------------------------------------------------
# Step 1: Parse all toolchain files for version/git-source mapping
# ---------------------------------------------------------------------------
def parse_toolchains():
    """Return dict: pkg_lower -> {'version': str, 'git': str or None, 'name': str}"""
    pkg_map = {}

    toolchain_files = glob.glob(f"{LCGCMAKE}/cmake/toolchain/heptools-*.cmake")
    toolchain_files += glob.glob(f"{LCGCMAKE}/cmake/modules/heptools-common.cmake")
    toolchain_files += glob.glob(f"{LCGCMAKE}/cmake/toolchain/contrib/*.cmake")

    for tf in toolchain_files:
        content = open(tf).read()
        # Match LCG_external_package(Name version [optional-dir] [KEY=val ...])
        # and LCG_AA_project(Name version [GIT=url])
        for m in re.finditer(
            r'(?:LCG_external_package|LCG_AA_project)\s*\(\s*(\S+)\s+(\S+)(.*?)\)',
            content, re.DOTALL
        ):
            name = m.group(1)
            version = m.group(2).strip()
            rest = m.group(3).strip()

            # Extract GIT= annotation
            git_m = re.search(r'GIT=(\S+)', rest)
            git_url = git_m.group(1) if git_m else None

            key = name.lower()
            if key not in pkg_map:
                pkg_map[key] = {'name': name, 'version': version, 'git': git_url}

    return pkg_map

# ---------------------------------------------------------------------------
# Step 2: Parse LCGPackage_Add blocks
# ---------------------------------------------------------------------------
def parse_cmake_packages(cmake_file):
    """Parse all LCGPackage_Add blocks from a CMakeLists.txt file."""
    content = open(cmake_file).read()
    packages = []

    # Find all LCGPackage_Add( ... ) blocks
    # They span from LCGPackage_Add( to the matching closing )
    pos = 0
    pattern = re.compile(r'LCGPackage_Add\s*\(', re.IGNORECASE)

    while True:
        m = pattern.search(content, pos)
        if not m:
            break

        start = m.end()
        depth = 1
        i = start
        while i < len(content) and depth > 0:
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
            i += 1

        block = content[start:i-1].strip()
        pkg = parse_package_block(block)
        if pkg:
            packages.append(pkg)

        pos = i

    return packages


def parse_package_block(block):
    """Parse a single LCGPackage_Add block body into a dict."""
    lines = block.split('\n')
    if not lines:
        return None

    # First token is the package name
    first = lines[0].strip()
    name = first.split()[0] if first.split() else None
    if not name:
        return None

    pkg = {
        'name': name,
        'url': None,
        'git_repo': None,
        'git_tag': None,
        'configure_command': None,
        'cmake_args': [],
        'build_command': None,
        'install_command': None,
        'depends': [],
        'depends_opt': [],
        'build_in_source': False,
        'binary_package': False,
        'environment': [],
        'revision': None,
        'raw_block': block,
    }

    # Join the block for multi-line parsing
    text = ' '.join(l.strip() for l in lines[1:])

    # Extract URL
    url_m = re.search(r'\bURL\s+(\S+)', text)
    if url_m:
        pkg['url'] = url_m.group(1)

    # Extract GIT_REPOSITORY
    git_m = re.search(r'GIT_REPOSITORY\s+(\S+)', text)
    if git_m:
        pkg['git_repo'] = git_m.group(1)

    git_tag_m = re.search(r'GIT_TAG\s+(\S+)', text)
    if git_tag_m:
        pkg['git_tag'] = git_tag_m.group(1)

    # Extract CONFIGURE_COMMAND
    conf_m = re.search(r'CONFIGURE_COMMAND\s+(.*?)(?=\s+(?:BUILD_COMMAND|INSTALL_COMMAND|CMAKE_ARGS|DEPENDS|BUILD_IN_SOURCE|ENVIRONMENT|REVISION|BINARY_PACKAGE|BUNDLE_PACKAGE|NO_STRIP|PACKAGE_FINDER|TEST_COMMAND|UPDATE_COMMAND|BUILD_ALWAYS|IF\s)|\s*$)', text)
    if conf_m:
        pkg['configure_command'] = conf_m.group(1).strip()

    # Extract CMAKE_ARGS
    cmake_m = re.search(r'CMAKE_ARGS\s+(.*?)(?=\s+(?:BUILD_COMMAND|INSTALL_COMMAND|DEPENDS|BUILD_IN_SOURCE|ENVIRONMENT|REVISION|BINARY_PACKAGE|BUNDLE_PACKAGE|NO_STRIP|PACKAGE_FINDER|TEST_COMMAND|UPDATE_COMMAND|IF\s)|\s*$)', text)
    if cmake_m:
        # Parse individual -D flags
        args_text = cmake_m.group(1).strip()
        # Strip cmake conditional blocks
        args_text = re.sub(r'IF\s.*?ENDIF', ' ', args_text, flags=re.DOTALL)
        pkg['cmake_args'] = [a.strip() for a in args_text.split() if a.strip().startswith('-')]

    # Extract BUILD_COMMAND
    build_m = re.search(r'BUILD_COMMAND\s+(.*?)(?=\s+(?:INSTALL_COMMAND|DEPENDS|BUILD_IN_SOURCE|ENVIRONMENT|REVISION|BINARY_PACKAGE|CONFIGURE_COMMAND|CMAKE_ARGS|TEST_COMMAND|UPDATE_COMMAND|IF\s)|\s*$)', text)
    if build_m:
        pkg['build_command'] = build_m.group(1).strip()

    # Extract INSTALL_COMMAND
    inst_m = re.search(r'INSTALL_COMMAND\s+(.*?)(?=\s+(?:DEPENDS|BUILD_IN_SOURCE|ENVIRONMENT|REVISION|BINARY_PACKAGE|CONFIGURE_COMMAND|CMAKE_ARGS|BUILD_COMMAND|TEST_COMMAND|UPDATE_COMMAND|IF\s)|\s*$)', text)
    if inst_m:
        pkg['install_command'] = inst_m.group(1).strip()

    # Extract DEPENDS
    dep_m = re.search(r'\bDEPENDS\s+(.*?)(?=\s+(?:BUILD_IN_SOURCE|ENVIRONMENT|REVISION|BINARY_PACKAGE|CONFIGURE_COMMAND|CMAKE_ARGS|BUILD_COMMAND|INSTALL_COMMAND|DEPENDS_OPT|TEST_COMMAND|UPDATE_COMMAND|NO_STRIP|BUILD_WITH_INSTRUCTION|IF\s)|\s*$)', text)
    if dep_m:
        deps_raw = dep_m.group(1).strip()
        # Strip conditional blocks
        deps_raw = re.sub(r'IF\s.*?ENDIF', ' ', deps_raw, flags=re.DOTALL)
        pkg['depends'] = [d.strip() for d in deps_raw.split() if d.strip() and not d.strip().startswith('$') and not d.strip().startswith('<')]

    # Extract DEPENDS_OPT
    dopt_m = re.search(r'\bDEPENDS_OPT\s+(.*?)(?=\s+(?:BUILD_IN_SOURCE|ENVIRONMENT|REVISION|BINARY_PACKAGE|CONFIGURE_COMMAND|CMAKE_ARGS|BUILD_COMMAND|INSTALL_COMMAND|DEPENDS\b|TEST_COMMAND|UPDATE_COMMAND|NO_STRIP|IF\s)|\s*$)', text)
    if dopt_m:
        dopt_raw = dopt_m.group(1).strip()
        dopt_raw = re.sub(r'IF\s.*?ENDIF', ' ', dopt_raw, flags=re.DOTALL)
        pkg['depends_opt'] = [d.strip() for d in dopt_raw.split() if d.strip() and not d.strip().startswith('$')]

    # Flags
    if 'BUILD_IN_SOURCE' in text and '1' in text[text.find('BUILD_IN_SOURCE'):text.find('BUILD_IN_SOURCE')+20]:
        pkg['build_in_source'] = True
    if 'BINARY_PACKAGE' in text:
        pkg['binary_package'] = True

    # Revision
    rev_m = re.search(r'\bREVISION\s+(\d+)', text)
    if rev_m:
        pkg['revision'] = rev_m.group(1)

    return pkg


# ---------------------------------------------------------------------------
# Step 3: Determine recipe type
# ---------------------------------------------------------------------------
def determine_recipe_type(pkg):
    """Returns 'cmake', 'autotools', 'make', 'pip', 'binary'."""
    if pkg.get('binary_package'):
        return 'binary'

    conf = pkg.get('configure_command') or ''

    if pkg.get('cmake_args'):
        return 'cmake'
    if re.search(r'cmake\b', conf, re.IGNORECASE) and 'configure' not in conf.lower():
        return 'cmake'
    if 'configure' in conf.lower() or 'autoconf' in conf.lower() or 'autogen' in conf.lower():
        return 'autotools'
    if conf == '<VOID>' or not conf:
        # Check build/install commands
        build = pkg.get('build_command') or ''
        if 'pip install' in build or 'python' in build.lower():
            return 'pip'
        if 'make' in build.lower() or not build or build == '<VOID>':
            return 'make'

    return 'make'


# ---------------------------------------------------------------------------
# Step 4: Resolve source URL
# ---------------------------------------------------------------------------
def resolve_url(pkg, version):
    """Convert lcgcmake URL patterns to actual URLs."""
    url = pkg.get('url') or ''

    if pkg.get('git_repo'):
        src = pkg['git_repo']
        tag = pkg.get('git_tag') or version
        tag = tag.replace('<VERSION>', version).replace('<NATIVE_VERSION>', version)
        return src, tag

    if not url:
        return None, version

    # Replace cmake variable placeholders
    url = url.replace('${GenURL}', GEN_URL)
    url = url.replace('${gen_url}', GEN_URL_MC)
    url = url.replace('<VERSION>', version)
    url = url.replace('<NATIVE_VERSION>', version)

    # Replace unresolved cmake vars with version
    url = re.sub(r'\$\{[^}]+native_version\}', version, url)
    url = re.sub(r'\$\{[^}]+_version\}', version, url)
    url = re.sub(r'\$\{[^}]+VERSION[^}]*\}', version, url)
    url = re.sub(r'<[^>]*_author>', version, url)
    url = re.sub(r'<[^>]*version[^>]*>', version, url, flags=re.IGNORECASE)

    # If still has unresolved vars, use as-is as note
    return url, version


# ---------------------------------------------------------------------------
# Step 5: Translate configure args to bash
# ---------------------------------------------------------------------------
def translate_configure_args(conf_cmd, version):
    """Convert cmake CONFIGURE_COMMAND to bash."""
    if not conf_cmd or conf_cmd == '<VOID>':
        return None

    # Replace cmake placeholders with bash equivalents
    conf = conf_cmd
    conf = conf.replace('<INSTALL_DIR>', '$INSTALLROOT')
    conf = conf.replace('<SOURCE_DIR>', '$SOURCEDIR')
    conf = conf.replace('<BINARY_DIR>', '$BUILDDIR')
    conf = conf.replace('<VERSION>', version)
    conf = conf.replace('<NATIVE_VERSION>', version)
    conf = conf.replace('${CMAKE_CXX_COMPILER}', '$CXX')
    conf = conf.replace('${CMAKE_C_COMPILER}', '$CC')
    conf = conf.replace('${CMAKE_Fortran_COMPILER}', '$FC')
    conf = conf.replace('${CMAKE_BUILD_TYPE}', 'Release')
    conf = conf.replace('${CMAKE_CXX_STANDARD}', '17')
    conf = conf.replace('${CMAKE_INSTALL_PREFIX}', '$INSTALLROOT')
    conf = conf.replace('${MAKE}', 'make ${JOBS:+-j $JOBS}')

    # Replace ${pkg_home} with ${PKG_ROOT} pattern (approximate)
    conf = re.sub(r'\$\{(\w+)_home\}', r'${\1_ROOT}', conf)
    conf = re.sub(r'\$\{(\w+)_native_version\}', version, conf)
    conf = re.sub(r'\$\{[A-Z_]+_VERSION[^}]*\}', version, conf)

    # Remove IF...THEN...ENDIF blocks (keep inner content with comment)
    conf = re.sub(r'IF\s+.*?THEN(.*?)ENDIF', r'# platform-conditional:\1', conf, flags=re.DOTALL)

    return conf.strip()


def translate_cmake_args(cmake_args, version):
    """Build cmake command from CMAKE_ARGS list."""
    if not cmake_args:
        return None

    args = []
    for a in cmake_args:
        a = a.replace('<INSTALL_DIR>', '$INSTALLROOT')
        a = a.replace('${CMAKE_BUILD_TYPE}', 'Release')
        a = a.replace('${CMAKE_CXX_STANDARD}', '17')
        a = a.replace('${CMAKE_CXX_COMPILER}', '$CXX')
        a = a.replace('${CMAKE_C_COMPILER}', '$CC')
        a = a.replace('<VERSION>', version)
        a = re.sub(r'\$\{(\w+)_home\}', r'${\1_ROOT}', a)
        a = re.sub(r'\$\{[^}]+native_version\}', version, a)
        args.append(a)

    return args


# ---------------------------------------------------------------------------
# Step 6: Generate MODULE_OPTIONS
# ---------------------------------------------------------------------------
def guess_module_options(pkg, recipe_type):
    """Guess appropriate MODULE_OPTIONS flags."""
    name = pkg['name'].lower()

    # Python packages
    if recipe_type == 'pip':
        return '--python'

    # Header-only
    header_only = ['eigen', 'rangev3', 'cppgsl', 'nlohmann', 'rapidjson',
                   'flatbuffers', 'catch2', 'googlebenchmark', 'googletest',
                   'xsimd', 'vc', 'vectorclass', 'ms_gsl', 'cppzmq']
    if any(h in name for h in header_only):
        return '--include'

    # Tools/compilers
    if name in ('cmake', 'gcc', 'binutils', 'autoconf', 'automake',
                'libtool', 'bison', 'flex', 'm4', 'gperf', 'ccache', 'ant'):
        return '--bin'

    # Generators (usually --bin --lib)
    if recipe_type in ('autotools', 'make') and any(
        g in name for g in ('pythia', 'herwig', 'sherpa', 'rivet', 'lhapdf',
                            'thepeg', 'agile', 'yoda', 'evtgen', 'hepmc',
                            'madgraph', 'gosam')
    ):
        return '--bin --lib'

    # Most C++ libraries
    return '--bin --lib'


# ---------------------------------------------------------------------------
# Step 7: Generate description
# ---------------------------------------------------------------------------
def get_description(name, category):
    key = name.lower().replace('-', '_').replace('+', 'p')

    if key in DESCRIPTIONS:
        return DESCRIPTIONS[key]

    # Heuristics
    if category == 'pyexternals':
        return f"{name} Python package"
    if category == 'generators':
        return f"{name} Monte Carlo event generator"
    if category == 'key4hep':
        return f"{name} Key4hep framework package"
    if category == 'gridexternals':
        return f"{name} grid computing tool"

    return f"{name} library/tool (from LCG software stack)"


# ---------------------------------------------------------------------------
# Step 8: Guess license
# ---------------------------------------------------------------------------
def guess_license(name):
    licenses = {
        'boost': 'BSL-1.0',
        'root': 'LGPL-2.1-only',
        'geant4': 'LicenseRef-Geant4',
        'cmake': 'BSD-3-Clause',
        'python': 'Python-2.0',
        'pythia8': 'GPL-2.0-only',
        'pythia6': 'LicenseRef-Pythia6',
        'herwig': 'GPL-2.0-only',
        'sherpa': 'GPL-2.0-or-later',
        'lhapdf': 'GPL-2.0-only',
        'rivet': 'GPL-3.0-only',
        'hepmc': 'LGPL-2.1-only',
        'hepmc3': 'LGPL-2.1-only',
        'thepeg': 'LGPL-2.1-only',
        'gcc': 'GPL-3.0-only',
        'gsl': 'GPL-3.0-or-later',
        'blas': 'BSD-3-Clause',
        'zlib': 'Zlib',
        'curl': 'curl',
        'openssl': 'Apache-2.0',
        'sqlite': 'blessing',
        'expat': 'MIT',
        'libxml2': 'MIT',
        'tbb': 'Apache-2.0',
        'xercesc': 'Apache-2.0',
        'arrow': 'Apache-2.0',
        'protobuf': 'BSD-3-Clause',
        'grpc': 'Apache-2.0',
        'flatbuffers': 'Apache-2.0',
        'catch2': 'BSL-1.0',
        'googletest': 'BSD-3-Clause',
        'googlebenchmark': 'Apache-2.0',
        'fmt': 'MIT',
        'spdlog': 'MIT',
        'eigen': 'MPL-2.0',
        'clhep': 'LGPL-3.0-only',
        'dd4hep': 'LGPL-3.0-only',
        'gaudi': 'Apache-2.0',
        'podio': 'Apache-2.0',
        'edm4hep': 'Apache-2.0',
        'acts': 'MPL-2.0',
        'ginac': 'GPL-2.0-only',
        'cln': 'GPL-2.0-only',
    }
    return licenses.get(name.lower(), 'TODO')


# ---------------------------------------------------------------------------
# Step 9: Generate the bits recipe
# ---------------------------------------------------------------------------
def make_recipe(pkg, version, git_url, category):
    name = pkg['name']
    pkg_lower = name.lower()
    recipe_type = determine_recipe_type(pkg)
    description = get_description(name, category)
    license_id = guess_license(pkg_lower)
    module_opts = guess_module_options(pkg, recipe_type)

    source_url, tag = resolve_url(pkg, version)

    # Clean up deps — filter out cmake infrastructure variables
    def clean_dep(d):
        # Skip cmake variables, empty strings, cmake-specific things
        skip = {'python_cmd', 'make', 'cmake_command', 'exec', 'void',
                'mksitepackagesdir', 'pysetupoptions', 'command', 'lockfile'}
        dl = d.lower().strip('${}()')
        if dl in skip or dl.startswith('cmake_') or dl.startswith('lcg_') or not dl:
            return None
        if dl in ('if', 'then', 'else', 'endif', 'not', 'defined', 'strequal', 'matches'):
            return None
        return d

    raw_deps = [clean_dep(d) for d in pkg.get('depends', [])]
    deps = [d for d in raw_deps if d]

    raw_opt_deps = [clean_dep(d) for d in pkg.get('depends_opt', [])]
    opt_deps = [d for d in raw_opt_deps if d]

    # ---- YAML Header ----
    lines = []
    lines.append(f"package: {name}")
    lines.append(f"description: {description}")
    lines.append(f"version: \"{version}\"")
    lines.append(f"tag: \"{tag}\"")

    if source_url:
        # Use sources: (list) for tarball URLs, source: for git repos
        import re as _re
        if _re.search(r'\.(tar\.(gz|bz2|xz|zst)|tgz|zip|tar)$', source_url, _re.IGNORECASE):
            lines.append("sources:")
            lines.append(f"  - {source_url}")
        else:
            lines.append(f"source: {source_url}")

    if deps:
        lines.append("requires:")
        for d in deps:
            lines.append(f"  - {d}")

    if opt_deps:
        lines.append("  # optional:")
        for d in opt_deps:
            lines.append(f"  # - {d}")

    lines.append("build_requires:")
    lines.append("  - bits-recipe-tools")

    lines.append(f"license: {license_id}")
    lines.append("---")

    # ---- Bash Body ----
    lines.append("#!/bin/bash -e")
    lines.append("##############################")

    if recipe_type in ('cmake', 'make', 'binary'):
        lines.append(". $(bits-include CMakeRecipe)")
    elif recipe_type == 'autotools':
        lines.append(". $(bits-include AutoToolsRecipe)")
    elif recipe_type == 'pip':
        lines.append(". $(bits-include CMakeRecipe)")

    lines.append("##############################")
    lines.append(f'MODULE_OPTIONS="{module_opts}"')
    lines.append("##############################")

    # Generate functions based on recipe type
    if recipe_type == 'cmake':
        cmake_args = translate_cmake_args(pkg.get('cmake_args', []), version)
        configure_lines = []
        if cmake_args:
            configure_lines.append(f"  cmake $SOURCEDIR \\")
            for i, arg in enumerate(cmake_args):
                sep = " \\" if i < len(cmake_args) - 1 else ""
                configure_lines.append(f"    {arg}{sep}")
        else:
            conf = translate_configure_args(pkg.get('configure_command'), version)
            if conf and conf != 'true':
                for l in conf.split('\n'):
                    configure_lines.append(f"  {l.strip()}")

        if configure_lines:
            lines.append("function Configure() {")
            lines.extend(configure_lines)
            lines.append("}")

        # Make function only if custom build command
        build = pkg.get('build_command') or ''
        if build and build not in ('<VOID>', '${MAKE}', '${MAKE} -j8'):
            build = translate_configure_args(build, version)
            lines.append("function Make() {")
            lines.append(f"  {build}")
            lines.append("}")

    elif recipe_type == 'autotools':
        conf = translate_configure_args(pkg.get('configure_command'), version)
        if conf and conf not in ('<VOID>', './configure --prefix=$INSTALLROOT'):
            if pkg.get('build_in_source'):
                lines.append("function Configure() {")
                lines.append("  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .")
                # Emit the configure command
                for l in conf.split('\n'):
                    if l.strip():
                        lines.append(f"  {l.strip()}")
                lines.append("}")
            else:
                lines.append("function Configure() {")
                for l in conf.split('\n'):
                    if l.strip():
                        lines.append(f"  {l.strip()}")
                lines.append("}")

    elif recipe_type == 'make':
        build = pkg.get('build_command') or ''
        install = pkg.get('install_command') or ''
        conf = pkg.get('configure_command') or ''

        make_lines = []
        if pkg.get('build_in_source'):
            make_lines.append("  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .")

        if conf and conf not in ('<VOID>', ''):
            conf_bash = translate_configure_args(conf, version)
            if conf_bash:
                make_lines.append(f"  {conf_bash}")

        if build and build not in ('<VOID>',):
            b = translate_configure_args(build, version)
            make_lines.append(f"  {b}")
        else:
            make_lines.append("  make ${JOBS:+-j $JOBS}")

        if install and install not in ('<VOID>',):
            inst = translate_configure_args(install, version)
            for l in inst.split('\n'):
                if l.strip():
                    make_lines.append(f"  {l.strip()}")
        else:
            make_lines.append("  make install")

        if make_lines:
            lines.append("function Make() {")
            lines.extend(make_lines)
            lines.append("}")

    elif recipe_type == 'pip':
        lines.append("function Make() {")
        lines.append("  pip install --prefix=\"$INSTALLROOT\" --no-deps .")
        lines.append("}")

    elif recipe_type == 'binary':
        lines.append("function Make() {")
        lines.append("  # Binary package - extract and copy")
        lines.append("  rsync -a --delete $SOURCEDIR/ $INSTALLROOT/")
        lines.append("}")

    return '\n'.join(lines) + '\n'


# ---------------------------------------------------------------------------
# Step 10: Main - process all packages
# ---------------------------------------------------------------------------
def main():
    print("Parsing toolchain files...")
    pkg_map = parse_toolchains()
    print(f"  Found {len(pkg_map)} package version definitions")

    # Which CMakeLists.txt files to process and their category labels
    cmake_files = [
        (f"{LCGCMAKE}/externals/CMakeLists.txt", "externals"),
        (f"{LCGCMAKE}/generators/CMakeLists.txt", "generators"),
        (f"{LCGCMAKE}/frameworks/CMakeLists.txt", "frameworks"),
        (f"{LCGCMAKE}/projects/CMakeLists.txt", "projects"),
        (f"{LCGCMAKE}/key4hep/CMakeLists.txt", "key4hep"),
        (f"{LCGCMAKE}/gridexternals/CMakeLists.txt", "gridexternals"),
        (f"{LCGCMAKE}/contrib/CMakeLists.txt", "contrib"),
        (f"{LCGCMAKE}/pyexternals/CMakeLists.txt", "pyexternals"),
    ]

    all_packages = {}  # name_lower -> (pkg, category)

    for cmake_file, category in cmake_files:
        if not os.path.exists(cmake_file):
            continue
        print(f"Parsing {category}...")
        packages = parse_cmake_packages(cmake_file)
        print(f"  Found {len(packages)} packages")
        for pkg in packages:
            key = pkg['name'].lower()
            if key not in all_packages:
                all_packages[key] = (pkg, category)

    print(f"\nTotal unique packages: {len(all_packages)}")

    # Generate recipes
    generated = 0
    skipped = 0
    no_version = 0

    for pkg_key, (pkg, category) in sorted(all_packages.items()):
        name = pkg['name']

        # Get version from toolchain map
        info = pkg_map.get(pkg_key) or pkg_map.get(name.lower())

        if not info:
            # Try case-insensitive search
            for k, v in pkg_map.items():
                if k.lower() == pkg_key.lower() or v['name'].lower() == name.lower():
                    info = v
                    break

        if not info:
            # No version defined — create a placeholder
            version = "unknown"
            git_url = None
            no_version += 1
        else:
            version = info['version']
            git_url = info.get('git')

        # Skip packages with HEAD versions if no git URL
        if version in ('HEAD', '') and not git_url:
            skipped += 1
            continue

        try:
            recipe = make_recipe(pkg, version, git_url, category)

            # Create filename - lowercase, replace special chars with -
            filename = re.sub(r'[^a-z0-9_.-]', '-', name.lower()) + '.sh'
            out_path = os.path.join(OUTPUT_DIR, filename)

            with open(out_path, 'w') as f:
                f.write(recipe)

            generated += 1
        except Exception as e:
            print(f"  ERROR generating {name}: {e}")
            skipped += 1

    print(f"\nResults:")
    print(f"  Generated: {generated}")
    print(f"  Skipped (HEAD/error): {skipped}")
    print(f"  No version found: {no_version} (used 'unknown')")
    print(f"  Output: {OUTPUT_DIR}/")


if __name__ == '__main__':
    main()
