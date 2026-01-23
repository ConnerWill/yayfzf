#!/usr/bin/env bash
#vim:filetype=sh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2155,2034,2154,2059
set -Eeo pipefail

#######################################
# METADATA
#######################################
readonly REPO_ROOT="$(git rev-parse --show-toplevel)"
readonly SCRIPT_DIR="${REPO_ROOT}/scripts"
readonly SCRIPT_LIB="${SCRIPT_DIR}/lib.sh"
readonly PROG="$(basename "${BASH_SOURCE[0]}")"
readonly SCRIPT_DESCRIPTION="Delete Github release"

#######################################
# CONFIGURATION
#######################################
readonly BRANCH="main"
readonly ASSET="${REPO_ROOT}/bin/rclonefzf"
readonly VERBOSE=${VERBOSE:-true}

if [[ -e "${SCRIPT_LIB}" ]]; then
  if ! source "${SCRIPT_LIB}"; then
    die "Unable to source library: ${SCRIPT_LIB}"
  fi
else
  die "Cannot find library file: ${SCRIPT_LIB}"
fi


#######################################
# FUNCTIONS
#######################################

usage() {
  cat >&2 <<EOF
NAME:

    ${PROG}


DESCRIPTION:

    ${SCRIPT_DESCRIPTION}


SYNOPSIS:

    ${PROG} <new_version>


EXAMPLES:

    Delete 2.0.1 release

        $ ${PROG} 2.0.1

    Delete latest release

        $ ${PROG}

    Show help

        $ ${PROG} -h


EOF
  exit 1
}

check_release() {
  local release_version="${1}"
  if gh release view "${release_version}" >/dev/null 2>&1; then
    verbose "Found release: ${release_version}"
    return 0
  else
    die "Cannot find release: ${release_version}"
  fi
}

delete_release() {
  local release_version="${1}"
  verbose "Deleting release: ${release_version} ..."
  if gh release delete "${release_version}" --yes --cleanup-tag; then
    success "Deleted release: ${release_version}"
  else
    die "Unable to delete release: ${release_version}"
  fi
}

#######################################
# MAIN
#######################################

while [[ $# -gt 0 ]]; do
  case "${1}" in
    -h|--help) usage ;;
    -*)        usage ;;
    *)         shift ;;
  esac
done


is_installed "git"

cd_directory "${REPO_ROOT}"

RELEASE_VERSION="${1}"
if [[ -z "${RELEASE_VERSION}" ]]; then
  RELEASE_VERSION="$(get_latest_tag)"
fi

is_installed "gh"

check_release "${RELEASE_VERSION}"
delete_release "${RELEASE_VERSION}"
