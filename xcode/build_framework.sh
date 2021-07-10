pushd ../bindings/bin
BIN_OUTPUT_DIRECTORY=`pwd`
rm -r LDKFramework*
popd

pushd ./LDKFramework
xcodebuild archive -scheme LDKFramework -destination "generic/platform=iOS" -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme LDKFramework -destination "generic/platform=iOS Simulator" -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#xcodebuild archive -scheme LDKFramework -destination "generic/platform=OS X" -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-macOS SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# disable mac and simulator compilation for the time being
#xcodebuild -create-xcframework \
#-framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
#-framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
#-framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-macOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
#-output ${BIN_OUTPUT_DIRECTORY}/LDKFramework.xcframework

xcodebuild -create-xcframework \
-framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
-framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
-output ${BIN_OUTPUT_DIRECTORY}/LDKFramework.xcframework
