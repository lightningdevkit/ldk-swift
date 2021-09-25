set -e # stop execution upon the first error

LDK_DIRECTORY=$1 # directory to compile the C bindings in
C_BINDINGS_SOURCE_DIRECTORY="${LDK_DIRECTORY}/lightning-c-bindings"

DIRECT_BINDINGS_PROJECT_DIRECTORY="`pwd`/DirectBindingsApp" # directory to copy the shared library and headers into
FRAMEWORK_PROJECT_DIRECTORY_IOS="`pwd`/LDKFramework" # directory to copy the shared library and headers into
FRAMEWORK_PROJECT_DIRECTORY_MAC="`pwd`/LDKFramework_Mac" # directory to copy the shared library and headers into

usage() {
	echo "USAGE: path/to/ldk-c-bindings"
	exit 1
}

[ "${LDK_DIRECTORY}" = "" ] && echo "Usage: ./docker_shell.sh /path/to/ldk-c-bindings" && exit 1;
[ ! -d "${LDK_DIRECTORY}" ] && echo "Provided directory does not exist" && exit 1;



cp "${C_BINDINGS_SOURCE_DIRECTORY}/include/"*.h $FRAMEWORK_PROJECT_DIRECTORY_IOS
cp "${C_BINDINGS_SOURCE_DIRECTORY}/include/"*.h $FRAMEWORK_PROJECT_DIRECTORY_MAC
cp "${C_BINDINGS_SOURCE_DIRECTORY}/include/"*.h $DIRECT_BINDINGS_PROJECT_DIRECTORY

cp "${LDK_DIRECTORY}/ldk-net/ldk_net."{c,h} $FRAMEWORK_PROJECT_DIRECTORY_IOS
cp "${LDK_DIRECTORY}/ldk-net/ldk_net."{c,h} $FRAMEWORK_PROJECT_DIRECTORY_MAC
cp "${LDK_DIRECTORY}/ldk-net/ldk_net."{c,h} $DIRECT_BINDINGS_PROJECT_DIRECTORY


# build for Catalyst
pushd $C_BINDINGS_SOURCE_DIRECTORY
export RUSTFLAGS=""

rustup override set nightly
cargo clean
cargo build -Z build-std=panic_abort,std --target x86_64-apple-ios-macabi --release
cp "${C_BINDINGS_SOURCE_DIRECTORY}/target/x86_64-apple-ios-macabi/release/libldk.a" $FRAMEWORK_PROJECT_DIRECTORY_MAC

rustup override unset
cargo clean
cargo lipo --release
cp "${C_BINDINGS_SOURCE_DIRECTORY}/target/universal/release/libldk.a" $FRAMEWORK_PROJECT_DIRECTORY_IOS
cargo lipo
cp "${C_BINDINGS_SOURCE_DIRECTORY}/target/universal/debug/libldk.a" $DIRECT_BINDINGS_PROJECT_DIRECTORY






