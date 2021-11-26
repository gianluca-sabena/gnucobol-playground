#!/bin/bash
#
#   REMEMBER TO check syntax with https://github.com/koalaman/shellcheck
#

#set -x          # debug enabled
set -e          # exit on first error
set -o pipefail # exit on any errors in piped commands


# @info:  Parses and validates the CLI arguments
# @args:	Global Arguments $@
# Detect OS (Linux or Windows)
declare CURRENT_PATH=""
declare SCRIPT_PATH=""
declare OPEN_BIN=""

case "$(uname -s)" in
Linux* | Darwin*)
  CURRENT_PATH="$(pwd)"
  SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  OPEN_BIN="open"
  ;;
CYGWIN* | MINGW*)
  CURRENT_PATH="$(pwd -W)"
  SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -W)"
  OPEN_BIN="start"
  ;;
*)
  echo "OS not detected... exit"
  exit 1
  ;;
esac


# @info:  Parses and validates the CLI arguments
# @args:	Global Arguments $@

function parseCli() {
  if [[ "$#" -eq 0 ]]; then
      echo "  ${0}: "
      echo ""
      echo "       apt-install-dep"
      echo "       java-jni-build | jjb"
      echo "       java-jni-run | jjr"
      exit 0
  fi
  while [[ "$#" -gt 0 ]]; do
    declare KEY="$1"
    declare VALUE="$2"
    case "${KEY}" in
    # exec command here
    apt-install-dep)
      if ! command -v apt &> /dev/null
      then
          echo "apt could not be found - only Debian like distro are supported!"
          exit
      fi
      sudo apt update
      sudo apt install ca-certificates curl openjdk-11-jdk openjdk-16-source gnucobol make swig
    ;;
    java-jni-build | jjb)
      cd "${SCRIPT_PATH}/java-jni"
      make build 
    ;;
    java-jni-run | jjr)
      cd "${SCRIPT_PATH}/java-jni"
      make run
    ;;
    -h | *)
      ${0}
      ;;
    esac
    shift
  done
}

parseCli "$@"
cd "${CURRENT_PATH}"
