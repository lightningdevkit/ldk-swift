#!/usr/bin/env sh
set -e # abort if any command fails

BIN_OUTPUT_DIRECTORY="`pwd`/build"

rm -rf $BIN_OUTPUT_DIRECTORY
rm -f libldk.a

xcodebuild archive -scheme LDKFramework_Mac \
  -destination "generic/platform=OS X" \
  -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Darwin \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
  -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Darwin.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
  -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Darwin.xcframework
