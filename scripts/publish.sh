#!/usr/bin/env bash
#vim:filetype=zsh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2155,2034,2034,2059
set -Eeo pipefail

#######################################
# METADATA
#######################################
readonly REPO_ROOT="$(git rev-parse --show-toplevel)"
readonly SCRIPT_DIR="${REPO_ROOT}/scripts"
readonly SCRIPT_LIB="${SCRIPT_DIR}/lib.sh"
readonly PROG="$(basename "${BASH_SOURCE[0]}")"
readonly BRANCH="main"
readonly SCRIPT_DESCRIPTION="Script to bump version, create release, publish to AUR"

#######################################
# CONFIGURATION
#######################################
VERBOSE=${VERBOSE:-true}
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

    ${PROG} <current_version> <new_version>


EXAMPLES:

    Update version '1.4.2' to version '1.5.0'

        $ ${PROG} 1.4.2 1.5.0

    Show this help

        $ ${PROG}


EOF
  exit 1
}

#######################################
# MAIN
#######################################
if [[ "${#}" -ne 2 ]]; then
  usage
fi

readonly CURRENT_VERSION="${1}"
readonly NEW_VERSION="${2}"

is_installed "git"
cd_directory "${REPO_ROOT}"
checkout_branch "${BRANCH}"

info "Running: bump-version.sh"
bash "${SCRIPT_DIR}/bump-version.sh" "${CURRENT_VERSION}" "${NEW_VERSION}"

commit_files "[AUTOMATED] Increase version from ${CURRENT_VERSION} to ${NEW_VERSION}"

info "Running: create-release.sh"
bash "${SCRIPT_DIR}/create-release.sh" "${NEW_VERSION}"

info "Running: push-to-aur.sh"
bash "${SCRIPT_DIR}/push-to-aur.sh"
