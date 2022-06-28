#!/bin/bash

# When building from Xcode we want to ensure that `cargo` is in PATH.
# as a convenience, add the default cargo install location
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$PATH:${HOME}/.cargo/bin"

LDK_DIRECTORY=$1 # directory to compile the C bindings in
C_BINDINGS_SOURCE_DIRECTORY="${LDK_DIRECTORY}/lightning-c-bindings"

usage() {
	echo "USAGE: path/to/ldk-c-bindings"
	exit 1
}

[ "${LDK_DIRECTORY}" = "" ] && echo "Usage: ./compile_dependency_binaries.sh /path/to/ldk-c-bindings" && exit 1;
[ ! -d "${LDK_DIRECTORY}" ] && echo "Provided directory does not exist" && exit 1;

if ! [[ -x "$(command -v cargo)" ]]; then
    echo 'error: Unable to find cargo command. Cargo is not installed visit rustup.rs.' >&2
    exit 127
fi

set -e # stop execution upon the first error

C_BINDINGS_SOURCE_DIRECTORY="$(cd ${LDK_DIRECTORY}; pwd)/lightning-c-bindings"

# https://stackoverflow.com/a/4774063/299711
BASEDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

BUILT_PRODUCTS_DIR="${BASEDIR}/binaries" # directory to copy the shared library and headers into
BUILD_LOG_PATH="${BASEDIR}/build_libldk.log"
TARGET_NAME="libldk"

# initialize the build log
echo -n "" > $BUILD_LOG_PATH

declare -a platforms=("iphoneos" "iphonesimulator" "macosx" "macosx")
declare -a llvm_target_triple_suffixes=("" "-simulator" "" "-macabi")
declare -a architectures=( "arm64" "arm64 x86_64" "arm64 x86_64" "arm64 x86_64" )

for (( i=0; i<4; i++ ));
do
    PLATFORM_NAME=${platforms[$i]}
    PLATFORM_HUMAN_NAME="${PLATFORM_NAME}"
    LLVM_TARGET_TRIPLE_SUFFIX=${llvm_target_triple_suffixes[$i]}
	ARCHS=${architectures[$i]}

	# sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
	sudo xcode-select -s /Applications/Xcode\ 13.2.1.app/Contents/Developer/

	if [[ $PLATFORM_NAME = "macosx" ]]; then
		if [[ $LLVM_TARGET_TRIPLE_SUFFIX = "-macabi" ]]; then
			RUST_TARGET_OS="ios-macabi"
			PLATFORM_HUMAN_NAME="catalyst"
			# sudo xcode-select --switch /Library/Developer/CommandLineTools
		else
			RUST_TARGET_OS="darwin"
		fi
	else
		RUST_TARGET_OS="ios"
	fi

	# Clean any pre-existing static libraries that doesn't align with what we're currently trying to build

	if [[ $CONFIGURATION = "Debug" ]]; then
		RUST_CONFIGURATION="debug"
		RUST_CONFIGURATION_FLAG=""
	else
		RUST_CONFIGURATION="release"
		RUST_CONFIGURATION_FLAG="--release"
	fi

	echo "Platform name: ${PLATFORM_NAME}" >> $BUILD_LOG_PATH
    echo "Configuration: ${RUST_CONFIGURATION}" >> $BUILD_LOG_PATH
    echo "LLVM Target Triple Suffix: ${LLVM_TARGET_TRIPLE_SUFFIX}" >> $BUILD_LOG_PATH

	INDIVIDUAL_ARCH_BINARY_DIR="${BUILT_PRODUCTS_DIR}/${RUST_CONFIGURATION}/${PLATFORM_HUMAN_NAME}/raw"
	LIPO_BINARY_DIR="${BUILT_PRODUCTS_DIR}/${RUST_CONFIGURATION}/${PLATFORM_HUMAN_NAME}/lipo"

	for ARCH in $ARCHS
	do
		CURRENT_ARCH_BINARY_DIR="${INDIVIDUAL_ARCH_BINARY_DIR}/${ARCH}"
		echo "Current architecture: ${ARCH}" >> $BUILD_LOG_PATH
		echo "Current architecture lipo input directory: ${CURRENT_ARCH_BINARY_DIR}" >> $BUILD_LOG_PATH

		# if whatever this weird lipo check is true
		if [[ $(lipo -info "${CURRENT_ARCH_BINARY_DIR}/${TARGET_NAME}" 2>&1) != *"${ARCH}"* ]]; then
			# remove the pre-lipo/raw/lipo-input binary
			rm -f "${CURRENT_ARCH_BINARY_DIR}/${TARGET_NAME}"
			# why do we need to remove it? Who knows
		fi
	done

	pushd $C_BINDINGS_SOURCE_DIRECTORY
	export RUSTFLAGS='--cfg=c_bindings'

	rustup override set nightly
	cargo clean

	EXECUTABLES=()
	for ARCH in $ARCHS
	do
		RUST_ARCH=$ARCH
		CURRENT_ARCH_BINARY_DIR="${INDIVIDUAL_ARCH_BINARY_DIR}/${ARCH}"
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

		echo "BUILDING ${RUST_ARCH}-apple-${RUST_TARGET_OS}" >> $BUILD_LOG_PATH
		cargo build -Z build-std=panic_abort,std --features "std" --target "${RUST_ARCH}-apple-${RUST_TARGET_OS}" $RUST_CONFIGURATION_FLAG
		echo "Finished building ${RUST_ARCH}-apple-${RUST_TARGET_OS}" >> $BUILD_LOG_PATH

		mkdir -p "${CURRENT_ARCH_BINARY_DIR}"
		cp "$C_BINDINGS_SOURCE_DIRECTORY/target/${RUST_ARCH}-apple-${RUST_TARGET_OS}/${RUST_CONFIGURATION}/${TARGET_NAME}.a" "${CURRENT_ARCH_BINARY_DIR}"
		EXECUTABLES+=("${CURRENT_ARCH_BINARY_DIR}/${TARGET_NAME}.a")
	done

	rustup override unset

	mkdir -p "${LIPO_BINARY_DIR}"

	echo "Current platform lipo output directory: ${LIPO_BINARY_DIR}" >> $BUILD_LOG_PATH
	echo "LIPOING ${PLATFORM_NAME}" >> $BUILD_LOG_PATH
	xcrun --sdk $PLATFORM_NAME lipo -create "${EXECUTABLES[@]}" -output "${LIPO_BINARY_DIR}/${TARGET_NAME}.a"
	echo "Finished lipoing ${PLATFORM_NAME}" >> $BUILD_LOG_PATH

	echo "" >> $BUILD_LOG_PATH

done
