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

is_installed "git"

readonly CURRENT_VERSION="${1}"
readonly NEW_VERSION="${2}"

validate_version "${CURRENT_VERSION}"
validate_version "${NEW_VERSION}"

compare_versions "${CURRENT_VERSION}" "${NEW_VERSION}"

cd_directory "${REPO_ROOT}"

# Find tracked files containing the current version
mapfile -t VERSION_FILES < <(
  git grep -l "${CURRENT_VERSION}" || true
)

if [[ "${#VERSION_FILES[@]}" -eq 0 ]]; then
  die "no files found containing version ${CURRENT_VERSION}"
fi

info "Updating version '${CURRENT_VERSION}' -> '${NEW_VERSION}'"
info "Files to be updated:"
for file in "${VERSION_FILES[@]}"; do
  printf '  - %s\n' "${file}"
done
printf '\n'

# Perform in-place replacement
for file in "${VERSION_FILES[@]}"; do
  verbose "Performing in-place replacement in file: '${file}'. ${CURRENT_VERSION} -> ${NEW_VERSION}"
  sed -i -E -e "s/(v?)${CURRENT_VERSION}/\1${NEW_VERSION}/g" "${file}"
done

success "Version bump complete. New version: ${NEW_VERSION}"
