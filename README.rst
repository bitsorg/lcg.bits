
lcg.bits
========

Bits is a tool to build, install and package large software stacks. It originates from the aliBuild tool, originally developed to simplify building and installing ALICE / ALFA software and attempts to make it more general and usable for other communities that share similar problems and have overlapping dependencies.

This repository contains recipes to build common software packages used by the LHC experiments.

To install bits, use::

 $ git clone git@github.com:bitsorg/bits.git; cd bits; export PATH=$PWD:$PATH; cd ..
 $ git clone git@github.com:bitsorg/lcg.bits.git
 $ cd lcg.bits

Review and customise bits.rc file (in particular, sw_dir location where all output will be stored)::

 $ cat bits.rc
[bits]
  organisation=LCG

[LCG]
  pkg_prefix=VO_LCG
  sw_dir=../sw
  repo_dir=.
  search_path=bits,general,simulation,hepmc,analysis,ml

Edit defaults-lcg.sh to define common variables or override specific package definitions (tag, source, ...)::

  $ cat defaults-lcg.rc
package: defaults-lcg
version: v1
env:
  CXXFLAGS: "-fPIC -g -O2 -std=c++20"
  CXXSTD: '20'
  CFLAGS: "-fPIC -g -O2"
  CMAKE_BUILD_TYPE: "RELWITHDEBINFO"
  GEANT4_BUILD_MULTITHREADED: 'OFF'
  MACOSX_DEPLOYMENT_TARGET: '14.0'
  ENABLE_IPO: 'OFF'
---

Edit lcg.sh meta package definitions in lcg.sh to specify all packages as dependencies::

  $ cat lcg.sh
package: LCG
version: "%(tag_basename)s"
tag: "v1.0"
build_requires:
  - "GCC-Toolchain:(?!osx)"
  - ROOT
  - GEANT4

---

Then, build LCG package using defaults-lcg ::

  $ bits build --defaults lcg LCG

Other than LCG metapackage, one can build any defined package directly from its recipe ::
 
  $ bits build --defaults lcg ROOT

You can list available packages and enter specific package environment using ::
 
 $ bits q 
 $ bits enter ROOT/latest
 $ root -b

To use docker and compile on different platform::

 $ bits build --docker -a slc7_x86-64 --defaults lcg ROOT  

Available architecture/containers::

   RHEL6 / SLC6 compatible: slc6_x86-64
   RHEL7 / CC7 compatible: slc7_x86-64
   RHEL8 / CC8 compatible: slc8_x86-64
   RHEL9 / ALMA9 compatible: slc9_x86-64
   Ubuntu 20.04 compatible: ubuntu2004_x86-64
   Ubuntu 22.04 compatible: ubuntu2204_x86-64
   Ubuntu 24.04 compatible: ubuntu2404_x86-64
   Fedora 33 compatible: fedora33_x86-64
   Fedora 34 compatible: fedora34_x86-64

To use alternative GCC tolchain (other than one defined in gcc-toolchain recipe), override definitions in another defaults file ::

  $ cat defaults-gcc13.sh
package: defaults-gcc13
version: v1
overrides:
  GCC-Toolchain:
    source: https://github.com/alisw/gcc-toolchain
    tag: v13.2.0-alice1
---

Now you can specify second defaults option on the command line::

  $ bits build --defaults lcg --defaults gcc13 LCG


Pre-requisites
==============

If you are using bits directly from git clone, you should make sure
you have the dependencies installed. The easiest way to do this is to run::

    pip install -e .

For developers
==========

If you want to contribute to bits, you can run the tests with::

    pip install -e .[test] # Only needed once
    tox

The test suite only runs fully on a Linux system, but there is a reduced suite for macOS, runnable with::

    tox -e darwin

You can also run only the unit tests (it's a lot faster than the full suite) with::

    pytest

To run the documentation locally, you can use::

    pip install -e .[docs]
    cd docs
    mkdocs serve
