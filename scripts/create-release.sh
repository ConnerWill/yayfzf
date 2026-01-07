#!/usr/bin/env bash
#vim:filetype=sh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2155,2034,2154,2059
set -Eeo pipefail

#######################################
# Script metadata
#######################################
readonly REPO_ROOT="$(git rev-parse --show-toplevel)"
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
# Configuration
#######################################
readonly BRANCH="main"

#######################################
# FUNCTIONS
#######################################
die() {
  printf "${TEXT_RED}${TEXT_BOLD}ERROR:${TEXT_RESET} ${TEXT_YELLOW}%s${TEXT_RESET}\n" "${1}" >&2
  exit 1
}

info() {
  printf "${TEXT_YELLOW}%s${TEXT_RESET}\n" "${1}"
}

success() {
  printf "${TEXT_GREEN}%s${TEXT_RESET}\n" "${1}"
}

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

checkout_branch() {
  local branch="${1}"
  if ! git checkout "${branch}" >/dev/null 2>&1; then
    die "Unable to checkout branch: ${branch}"
  fi
}

get_latest_tag() {
  git fetch --tags --quiet
  git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//'
}

is_installed() {
  local input_program="${1}"
  if ! command -v "${input_program}" >/dev/null 2>&1; then
    die "Could not find '${input_program}' in PATH. Make sure it is installed and is in your PATH"
  fi
}

validate_version() {
  local version="${1}"
  if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    die "invalid version '${version}' (expected x.x.x)"
  fi
}

compare_versions() {
  local current_version="${1}"
  local new_version="${2}"
  if [[ "${current_version}" == "${new_version}" ]]; then
    die "New version is the same as current version (${current_version})"
  fi
}

check_version_updated() {
  local current_version="${1}"
  local new_version="${2}"
  local matches
  matches="$(git grep --no-color --ignore-case --name-only --fixed-strings "${current_version}")"
  if [[ -z "${matches}" ]]; then
    success "No occurrences of current version: '${current_version}' found"
  else
    printf "Found occurrences of current version '${current_version}' in the following files:\n"
    printf " %s\n" "${matches}"
    die "You may have not updated the version in every file. Run 'bump-version.sh' to update the version"
  fi
}

check_uncommitted_files() {
  local git_status_output
  git_status_output="$(git status --porcelain)"
  if [[ -n "${git_status_output}" ]]; then
    printf " %s\n" "${git_status_output}"
    die "There are uncommitted changes in this repository"
  else
    success "Working directory is clean."
  fi
}

create_release() {
  local release_version
  local asset_path

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

cd "${REPO_ROOT}" || die "Cannot move to directory: ${REPO_ROOT}"

check_uncommitted_files

checkout_branch "${BRANCH}"

readonly NEW_VERSION="${1}"
readonly CURRENT_VERSION="$(get_latest_tag)"

validate_version "${NEW_VERSION}"

compare_versions "${CURRENT_VERSION}" "${NEW_VERSION}"

check_version_updated "${CURRENT_VERSION}" "${NEW_VERSION}"

is_installed "gh"
