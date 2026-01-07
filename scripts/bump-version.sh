#!/usr/bin/env bash
set -Eeuo pipefail

#######################################
# Configuration
#######################################
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Update this when the current version changes
readonly CURRENT_VERSION="1.0.6"

#######################################
# Functions
#######################################
die() {
  printf 'error: %s\n' "${1}" >&2
  exit 1
}

usage() {
  printf 'Usage: %s <new_version>\n\n' "$(basename "${0}")" >&2
  printf 'Example:\n  %s 1.0.7\n\n' "$(basename "${0}")" >&2
  printf 'Version format must be x.x.x\n' >&2
  exit 1
}

validate_version() {
  local version="${1}"

  if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    die "invalid version '${version}' (expected x.x.x)"
  fi
}

#######################################
# Main
#######################################
if [[ "${#}" -ne 1 ]]; then
  usage
fi

readonly NEW_VERSION="${1}"

validate_version "${NEW_VERSION}"

if [[ "${NEW_VERSION}" == "${CURRENT_VERSION}" ]]; then
  die "new version is the same as current version (${CURRENT_VERSION})"
fi

cd "${REPO_ROOT}"

# Find tracked files containing the current version
mapfile -t VERSION_FILES < <(
  git grep -l "${CURRENT_VERSION}" || true
)

if [[ "${#VERSION_FILES[@]}" -eq 0 ]]; then
  die "no files found containing version ${CURRENT_VERSION}"
fi

printf 'Updating version %s -> %s\n' "${CURRENT_VERSION}" "${NEW_VERSION}"
printf 'Files to be updated:\n'
for file in "${VERSION_FILES[@]}"; do
  printf '  - %s\n' "${file}"
done

# Perform in-place replacement
for file in "${VERSION_FILES[@]}"; do
  sed -i -e "s/\b${CURRENT_VERSION}\b/${NEW_VERSION}/g" "${file}"
done

printf 'Version bump complete.\n\n'

cat <<EOF
Next steps:
  git diff
  git commit -am "bump version to "${NEW_VERSION}"
EOF


