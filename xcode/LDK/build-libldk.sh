#!/bin/bash

# When building from Xcode we want to ensure that `cargo` is in PATH.
# as a convenience, add the default cargo install location
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$PATH:${HOME}/.cargo/bin"

if ! [[ -x "$(command -v cargo)" ]]; then
    echo 'error: Unable to find cargo command. Cargo is not installed visit rustup.rs.' >&2
    exit 127
fi

set -e # stop execution upon the first error
echo "LDK_C_BINDINGS_BASE: ${LDK_C_BINDINGS_BASE}"
C_BINDINGS_SOURCE_DIRECTORY="${LDK_C_BINDINGS_BASE}/lightning-c-bindings"
echo "C_BINDINGS_SOURCE_DIRECTORY: ${C_BINDINGS_SOURCE_DIRECTORY}"

# C_BINDINGS_SOURCE_DIRECTORY="$(cd ${LDK_C_BINDINGS_BASE}; pwd)/lightning-c-bindings"

# https://stackoverflow.com/a/4774063/299711
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BUILD_LOG_PATH="${BASEDIR}/build_libldk.log"

echo "BASEDIR: ${BASEDIR}"

echo ""
echo ""
echo "ENVIRONMENT START"
env
echo "ENVIRONMENT END"
echo ""
echo ""


cd "${LDK_C_BINDINGS_BASE}"
echo "WORKING DIRECTORY: `pwd`"

# echo -n "" > $BUILD_LOG_PATH
touch $BUILD_LOG_PATH

# create two newlines at the beginning
echo "" >> $BUILD_LOG_PATH

echo "Platform name: ${PLATFORM_NAME}" >> $BUILD_LOG_PATH
echo "Configuration: ${CONFIGURATION}" >> $BUILD_LOG_PATH
echo "LLVM Target Triple Suffix: ${LLVM_TARGET_TRIPLE_SUFFIX}" >> $BUILD_LOG_PATH

if [[ ${ACTION:-build} = "build" || $ACTION = "install" ]]; then
    TARGET_NAME="libldk"

    if [[ $PLATFORM_NAME = "" ]]; then
        # default for building with xcodebuild
        PLATFORM_NAME="macosx"
    fi

    if [[ $PLATFORM_NAME = "macosx" ]]; then
        if [[ $LLVM_TARGET_TRIPLE_SUFFIX = "-macabi" ]]; then
            RUST_TARGET_OS="ios-macabi"
        else
            RUST_TARGET_OS="darwin"
        fi
    else
        echo "PLATFORM_NAME ${PLATFORM_NAME}"
        RUST_TARGET_OS="ios"
    fi

    # Clean any pre-existing static libraries that doesn't align with what we're currently trying to build
    for ARCH in $ARCHS
    do
    	echo "Current Architecture: ${ARCH}" >> $BUILD_LOG_PATH
        if [[ $(lipo -info "${BUILT_PRODUCTS_DIR}/${TARGET_NAME}" 2>&1) != *"${ARCH}"* ]]; then
            rm -f "${BUILT_PRODUCTS_DIR}/${TARGET_NAME}"
        fi
    done

    if [[ $CONFIGURATION = "Debug" ]]; then
        RUST_CONFIGURATION="debug"
        RUST_CONFIGURATION_FLAG=""
    else
        RUST_CONFIGURATION="release"
        RUST_CONFIGURATION_FLAG="--release"
    fi

    pushd $C_BINDINGS_SOURCE_DIRECTORY
    export RUSTFLAGS='--cfg=c_bindings'

    rustup override set nightly
    cargo clean

    EXECUTABLES=()
    for ARCH in $ARCHS
    do
    	echo "CURRENT ARCHITECTURE: ${ARCH}"
        RUST_ARCH=$ARCH
        if [[ $RUST_ARCH = "arm64" ]]; then
            RUST_ARCH="aarch64"
            # This is because iOS Simulator builds for x86_64 is `x86_64-apple-ios`, while arm64 is `aarch64-apple-ios-sim`
            if [[ $PLATFORM_NAME = "iphonesimulator" ]]; then
                RUST_TARGET_OS="ios-sim"
            fi
        else
            if [[ $PLATFORM_NAME = "iphonesimulator" ]]; then
                RUST_TARGET_OS="ios"
            fi
        fi

        echo "BUILDING ${RUST_ARCH}-apple-${RUST_TARGET_OS}"

        cargo build -Z build-std=panic_abort,std --features "std" --target "${RUST_ARCH}-apple-${RUST_TARGET_OS}" $RUST_CONFIGURATION_FLAG
        EXECUTABLES+=("$C_BINDINGS_SOURCE_DIRECTORY/target/${RUST_ARCH}-apple-${RUST_TARGET_OS}/${RUST_CONFIGURATION}/${TARGET_NAME}.a")
    done

    rustup override unset

    mkdir -p "${BUILT_PRODUCTS_DIR}"
    # xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${PROJECT_DIR}/${TARGET_NAME}.a"
    xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${LDK_C_BINDINGS_BINARY_DIRECTORY}/${TARGET_NAME}.a"

    # print a newline at the end
    echo "" >> $BUILD_LOG_PATH
fi
