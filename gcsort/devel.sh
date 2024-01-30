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
    echo " cb | container-build               Docker buid"
    echo " cs | container-shell              Attach a shell to docker container"
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
    if ! command -v podman &>/dev/null; then
        echo "Container: docker or podman command are required, but could not be found... Install one of them and retry!"
        exit 1
    else
        echo "Container: Podman command found..."
        CONTAINER_BIN="podman"
    fi
else 
    echo "Container: Docker command found..."
    CONTAINER_BIN="docker"
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
    cb | container-build)
        echo "Run container"
        "${CONTAINER_BIN}" build -f "${SCRIPT_DIR}/rocky-linux-rpm.dockerfile" -t "${CONTAINER_NAME}:${CONTAINER_TAG}" "${SCRIPT_DIR}"
        exit
        ;;
    cs | container-shell)
       mkdir -p "${SCRIPT_DIR}/data"
       echo " Share data from host to container: "
       echo "  - Local data folder: ${SCRIPT_DIR}/data"
       echo "  - Container data: /host/data"
       "${CONTAINER_BIN}" run -t -i -v "${SCRIPT_DIR}/data:/host/data" --rm --name  "${CONTAINER_NAME}" "${CONTAINER_NAME}:${CONTAINER_TAG}"
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
