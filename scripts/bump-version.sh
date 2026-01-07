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
readonly SCRIPT_DESCRIPTION="Script to update semantic version in all files in a repo"
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

    Update version '1.0.0' to version '1.0.1'

        $ ${PROG} 1.0.0 1.0.1

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

validate_version "${CURRENT_VERSION}"
validate_version "${NEW_VERSION}"

compare_versions "${CURRENT_VERSION}" "${NEW_VERSION}"

cd "${REPO_ROOT}"

# Find tracked files containing the current version
mapfile -t VERSION_FILES < <(
  git grep -l "${CURRENT_VERSION}" || true
)

if [[ "${#VERSION_FILES[@]}" -eq 0 ]]; then
  die "no files found containing version ${CURRENT_VERSION}"
fi

printf "${TEXT_YELLOW}Updating version ${TEXT_GREEN}${TEXT_BOLD}%s${TEXT_RESET} ${TEXT_YELLOW}->${TEXT_RESET} ${TEXT_GREEN}${TEXT_BOLD}%s${TEXT_RESET}\n\n" "${CURRENT_VERSION}" "${NEW_VERSION}"
printf "${TEXT_YELLOW}${TEXT_BOLD}${TEXT_UNDERLINE}Files to be updated${TEXT_RESET}:${TEXT_RESET}\n"
for file in "${VERSION_FILES[@]}"; do
  printf '  - %s\n' "${file}"
done
printf '\n'

# Perform in-place replacement
for file in "${VERSION_FILES[@]}"; do
  sed -i -E -e "s/(v?)${CURRENT_VERSION}/\1${NEW_VERSION}/g" "${file}"
done

printf "${TEXT_GREEN}Version bump complete${TEXT_RESET}\n\n"
