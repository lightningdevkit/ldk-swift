set -e # bail upon first error

pushd ../bindings/bin
BIN_OUTPUT_DIRECTORY=`pwd`
rm -rf LDKFramework*
popd

pushd ./LDKFramework

# Build for both iOS and iOS Simulator
xcodebuild archive -scheme LDKFramework -destination "generic/platform=iOS" -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS ENABLE_BITCODE=NO CLANG_ADDRESS_SANITIZER=NO CLANG_ADDRESS_SANITIZER_ALLOW_ERROR_RECOVERY=NO CLANG_ADDRESS_SANITIZER_USE_AFTER_SCOPE=NO SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme LDKFramework -destination "generic/platform=iOS Simulator" -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim CLANG_ADDRESS_SANITIZER=NO CLANG_ADDRESS_SANITIZER_ALLOW_ERROR_RECOVERY=NO CLANG_ADDRESS_SANITIZER_USE_AFTER_SCOPE=NO SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

popd

ARCH=$(uname -m)
if [ "$ARCH" != "arm64" ]; then
    pushd ./LDKFramework_Mac
    xcodebuild archive -scheme LDKFramework -destination "platform=macOS,arch=x86_64,variant=Mac Catalyst" -archivePath ${BIN_OUTPUT_DIRECTORY}/LDKFramework-macOS ENABLE_BITCODE=NO ONLY_ACTIVE_ARCH=YES SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
    popd

    xcodebuild -create-xcframework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-macOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework.xcframework

    xcodebuild -create-xcframework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-macOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework-no-simulator.xcframework


    xcodebuild -create-xcframework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-macOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework-only-macOS.xcframework

    xcodebuild -create-xcframework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework-no-macOS.xcframework
else
    xcodebuild -create-xcframework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -framework ${BIN_OUTPUT_DIRECTORY}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
        -output ${BIN_OUTPUT_DIRECTORY}/LDKFramework.xcframework
fi
