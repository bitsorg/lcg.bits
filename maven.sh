package: maven
description: Apache Maven project management and comprehension tool
version: "3.8.5"
tag: "3.8.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-maven-3.8.5-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  # conf/settings.xml is distributed with CRLF line endings; normalise first
  # so that sed patterns match cleanly.
  sed -i 's/\r//' conf/settings.xml
  # Comment out the maven-default-http-blocker mirror added in Maven 3.8.1+.
  # It blocks all plain-HTTP repositories (including CERN's), which breaks
  # builds in the LCG environment.  Two <mirror> tags exist in the file:
  # the first is inside a <!-- --> doc-comment; the second (/2) is the live
  # HTTP-blocker block we wrap in a comment here.
  sed -i 's|^    <mirror>$|    <!-- <mirror>|2' conf/settings.xml
  sed -i '/<blocked>true<\/blocked>/{n; s|^    </mirror>$|    </mirror>\n    -->|;}' conf/settings.xml
}
