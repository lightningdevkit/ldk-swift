#!/usr/bin/env sh
set -e # abort if any command fails

BIN_OUTPUT_DIRECTORY="`pwd`/build"

rm -rf $BIN_OUTPUT_DIRECTORY

rm -f libldk.a

xcodebuild archive -scheme LDKFramework \
  -destination "generic/platform=iOS Simulator" \
  -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -f libldk.a

xcodebuild archive -scheme LDKFramework \
  -destination "generic/platform=iOS" \
  -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
  -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
  -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
  -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework.xcframework
