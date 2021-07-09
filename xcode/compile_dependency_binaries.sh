set -e # stop execution upon the first error

C_BINDINGS_DIRECTORY=$1 # directory to compile the C bindings in
LDK_FRAMEWORK_DIRECTORY="`pwd`/LDKFramework" # directory to copy the shared library and headers into

usage() {
	echo "USAGE: path/to/ldk-c-bindings"
	exit 1
}
[ "${C_BINDINGS_DIRECTORY}" = "" ] && usage
# [ "$3" != "true" -a "$3" != "false" ] && usage
# [ "$4" != "true" -a "$4" != "false" ] && usage

C_BINDINGS_SOURCE_DIRECTORY="${C_BINDINGS_DIRECTORY}/lightning-c-bindings"
pushd $C_BINDINGS_SOURCE_DIRECTORY

cp include/*.h $LDK_FRAMEWORK_DIRECTORY
cargo lipo --release
cp target/universal/release/*.a $LDK_FRAMEWORK_DIRECTORY
