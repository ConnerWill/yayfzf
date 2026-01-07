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
readonly SCRIPT_DESCRIPTION="Create Github release"
if [[ -z "${NO_COLOR}" ]]; then
  TEXT_RED='\x1B[0;38;5;196m'
  TEXT_YELLOW='\x1B[0;38;5;226m'
  TEXT_GREEN='\x1B[0;38;5;46m'
  TEXT_BOLD='\x1B[1m'
  TEXT_UNDERLINE='\x1B[4m'
  TEXT_ITALIC='\x1B[3m'
  TEXT_RESET='\x1B[0m'
fi

#######################################
# CONFIGURATION
#######################################
readonly BRANCH="main"
readonly ASSET="${REPO_ROOT}/bin/yayfzf"
readonly VERBOSE=true

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

    Create 2.0.0 release

        $ ${PROG} 2.0.0

    Show this help

        $ ${PROG}


EOF
  exit 1
}

create_release() {
  local release_version="v${1}"
  local asset_path="${2}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Creating release: ${release_version} ..."
  fi
  if gh release create "${release_version}" --latest --generate-notes --fail-on-no-commits "${asset_path}"; then
    success "Created release: ${release_version}"
  else
    die "Unable to create release: ${release_version}"
  fi
}

#######################################
# MAIN
#######################################
if [[ "${#}" -ne 1 ]]; then
  usage
fi

is_installed "git"

cd_directory "${REPO_ROOT}"

check_uncommitted_files

checkout_branch "${BRANCH}"

readonly NEW_VERSION="${1}"
readonly CURRENT_VERSION="$(get_latest_tag)"

validate_version "${NEW_VERSION}"

compare_versions "${CURRENT_VERSION}" "${NEW_VERSION}"

check_version_updated "${CURRENT_VERSION}" "${NEW_VERSION}"

is_installed "gh"

create_release "${NEW_VERSION}" "${ASSET}"

# gh release delete --yes --cleanup-tag v1.0.6
