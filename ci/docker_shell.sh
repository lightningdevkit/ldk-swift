pushd ../
PROJECT_DIRECTORY=`pwd`
LDK_DIRECTORY=$1
MOUNT_CI_FOLDER=$2
LDK_SUBDIRECTORY="$LDK_DIRECTORY/lightning-c-bindings"

[[ "${LDK_DIRECTORY}" = "" || "${MOUNT_CI_FOLDER}" = "" ]] && echo "Usage: ./docker_shell.sh /path/to/ldk-c-bindings true/false" && exit 1;
[ ! -d "${LDK_DIRECTORY}" ] && echo "Provided directory does not exist" && exit 1;
[ ! -d "${LDK_SUBDIRECTORY}" ] && echo "Provided directory does not contain lightning-c-bindings directory." && exit 1;

if [[ "${MOUNT_CI_FOLDER}" = "true" ]]; then
	# use for direct ci folder access
	cp -R bindings/batteries ci/LDKSwift/Sources/LDKSwift
	# docker run --name "swift-generator-shell" -e MOUNTED_CI_FOLDER=true -i -v $PROJECT_DIRECTORY/ci:/ci -v $LDK_DIRECTORY:/ldk-c-bindings --rm -t swift-generation-ci /bin/bash
	docker run --name "swift-generator-shell" -e MOUNTED_CI_FOLDER=true -i -v $PROJECT_DIRECTORY/ci:/ci -v $LDK_DIRECTORY:/ldk-c-bindings -v $PROJECT_DIRECTORY/src:/src --rm -t swift-generation-ci /bin/bash
elif [ "${MOUNT_CI_FOLDER}" = "false" ]; then
	docker run --name "swift-generator-shell" -e MOUNTED_CI_FOLDER=false -i -v $LDK_DIRECTORY:/ldk-c-bindings --rm -t swift-generation-ci /bin/bash
else
	echo "Usage: ./docker_shell.sh /path/to/ldk-c-bindings true/false" && exit 1;
fi
