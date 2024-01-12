#!/usr/bin/bash
################################################################################
#                              devel.sh                                        #
#                                                                              #
# Manage this application                                                      #
# ...                                                                          #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
# Config                                                                       #
################################################################################

CONTAINER_NAME="rocky-build"
CONTAINER_TAG="local"


SCRIPT_PATH="${BASH_SOURCE[0]}"
while [ -L "${SCRIPT_PATH}" ]; do
    SCRIPT_DIR="$(cd -P "$(dirname "${SCRIPT_PATH}")" >/dev/null 2>&1 && pwd)"
    SCRIPT_PATH="$(readlink "${SCRIPT_PATH}")"
    [[ ${SCRIPT_PATH} != /* ]] && SCRIPT_PATH="${SCRIPT_DIR}/${SCRIPT_PATH}"
done
SCRIPT_PATH="$(readlink -f "${SCRIPT_PATH}")"
SCRIPT_DIR="$(cd -P "$(dirname -- "${SCRIPT_PATH}")" >/dev/null 2>&1 && pwd)"
################################################################################
# Help                                                                         #
################################################################################
Help() {
    # Display Help
    echo "Developer helper."
    echo
    echo "Syntax: devel.sh command"
    echo "command:"
    echo " help                          Print this help"
    echo " dr | docker-run               Docker run"
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################

################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
if ! command -v docker &>/dev/null; then
    echo "docker is required, but could not be found... Install it."
    exit 1
fi
# Get the options
# Get the options
while [[ "$#" -gt 0 ]]; do
    declare KEY="$1"
    declare OPTARG="$2"
    case "${KEY}" in
    help|h|-h) # display Help
        Help
        exit
        ;;
    db | docker-build)
        echo "Run docker"

        docker build -f "${SCRIPT_DIR}/rocky-linux-rpm.dockerfile" -t "${CONTAINER_NAME}:${CONTAINER_TAG}" "${SCRIPT_DIR}"
        exit
        ;;
    ds | docker-shell)
       docker run -t -i --rm --name  "${CONTAINER_NAME}" "${CONTAINER_NAME}:${CONTAINER_TAG}"
       exit
       ;;

    *) # incorrect option
        echo "Error: Invalid option"
        Help
        exit
        ;;
    esac
done

Help
