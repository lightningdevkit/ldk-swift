set -e # bail upon first error

BIN_OUTPUT_DIRECTORY=`pwd`
BUILD_DIR=${BIN_OUTPUT_DIRECTORY}/build

mkdir -p $BUILD_DIR

pushd $BUILD_DIR
rm -rf LDKFramework*
popd

# As of clang 13, the `13.0` in the target `x86_64-apple-ios13.0-macabi` is dropped.
# However, in cc-rs, it is still hard-coded that way (https://github.com/rust-lang/cc-rs/pull/678).
# The only way for this script to run completely (i.e. include Mac Catalyst) is to switch to a version of Xcode
# that uses clang 12 (13.2.1 being the latest). Should be resolved after https://github.com/rust-lang/cc-rs/pull/678
sudo xcode-select -s /Applications/Xcode\ 13.2.1.app/Contents/Developer/

rm -f LDK/libldk.a
# Build for iOS
xcodebuild archive \
    -scheme LDKFramework \
    -workspace 'LDKFramework.xcworkspace' \
    -destination 'generic/platform=iOS' \
    -archivePath ${BUILD_DIR}/LDKFramework-iOS \
    ENABLE_BITCODE=NO \
    CLANG_ADDRESS_SANITIZER=NO CLANG_ADDRESS_SANITIZER_ALLOW_ERROR_RECOVERY=NO CLANG_ADDRESS_SANITIZER_USE_AFTER_SCOPE=NO \
    SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -f LDK/libldk.a
# Build for iOS Simulator
xcodebuild archive \
    -scheme LDKFramework \
    -workspace 'LDKFramework.xcworkspace' \
    -destination 'generic/platform=iOS Simulator' \
    -archivePath ${BUILD_DIR}/LDKFramework-Sim \
    ENABLE_BITCODE=NO \
    CLANG_ADDRESS_SANITIZER=NO CLANG_ADDRESS_SANITIZER_ALLOW_ERROR_RECOVERY=NO CLANG_ADDRESS_SANITIZER_USE_AFTER_SCOPE=NO \
    SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -f LDK/libldk.a
# Build for OS X Darwin
xcodebuild archive \
    -scheme LDKFramework_Mac \
    -workspace 'LDKFramework.xcworkspace' \
    -destination 'generic/platform=OS X' \
    -archivePath ${BUILD_DIR}/LDKFramework-Darwin \
    ENABLE_BITCODE=NO \
    CLANG_ADDRESS_SANITIZER=NO CLANG_ADDRESS_SANITIZER_ALLOW_ERROR_RECOVERY=NO CLANG_ADDRESS_SANITIZER_USE_AFTER_SCOPE=NO \
    SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -f LDK/libldk.a
# Build for macOS Catalyst
xcodebuild archive \
    -scheme LDKFramework \
    -workspace 'LDKFramework.xcworkspace' \
    -destination 'generic/platform=macOS' \
    -archivePath ${BUILD_DIR}/LDKFramework-Catalyst \
    ENABLE_BITCODE=NO \
    CLANG_ADDRESS_SANITIZER=NO CLANG_ADDRESS_SANITIZER_ALLOW_ERROR_RECOVERY=NO CLANG_ADDRESS_SANITIZER_USE_AFTER_SCOPE=NO \
    SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework ${BUILD_DIR}/LDKFramework-iOS.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
    -framework ${BUILD_DIR}/LDKFramework-Sim.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
    -framework ${BUILD_DIR}/LDKFramework-Darwin.xcarchive/Products/Library/Frameworks/LDKFramework_Mac.framework \
    -framework ${BUILD_DIR}/LDKFramework-Catalyst.xcarchive/Products/Library/Frameworks/LDKFramework.framework \
    -output ${BUILD_DIR}/LDKFramework.xcframework

# Switch back to default version of Xcode (presumably latest)
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer/
