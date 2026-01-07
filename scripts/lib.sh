#!/usr/bin/env bash
#vim:filetype=sh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2155,2034,2154,2059

die() {
  printf "${TEXT_RED}${TEXT_BOLD}ERROR:${TEXT_RESET} ${TEXT_YELLOW}%s${TEXT_RESET}\n" "${1}" >&2
  exit 1
}

info() {
  printf "${TEXT_YELLOW}%s${TEXT_RESET}\n" "${1}"
}

success() {
  printf "${TEXT_GREEN}%s${TEXT_RESET}\n\n" "${1}"
}

get_latest_tag() {
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Finding latest git tag ..."
  fi
  git fetch --tags --quiet
  git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//'
}

checkout_branch() {
  local branch="${1}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Checking out branch: '${branch}'"
  fi
  if ! git checkout "${branch}" >/dev/null 2>&1; then
    die "Unable to checkout branch: ${branch}"
  fi
}

clone_repo() {
  local repo_dir="${1}"
  local repo_url="${2}"
  if [[ ! -d "${repo_dir}" ]]; then
    if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
      info "Cloning repository ${repo_url} ..."
    fi
    git clone "${repo_url}" "${repo_dir}" || die "Failed to clone ${repo_url}"
  fi
}

check_uncommitted_files() {
  local git_status_output
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Searching for uncommitted changes ..."
  fi
  git_status_output="$(git status --porcelain)"
  if [[ -n "${git_status_output}" ]]; then
    printf "Files not committed:\n"
    printf "%s\n" "${git_status_output}"
    die "There are uncommitted changes in this repository"
  else
    if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
      success "Working directory is clean."
    fi
  fi
}

is_installed() {
  local input_program="${1}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Checking if '${input_program}' is installed ..."
  fi
  if command -v "${input_program}" >/dev/null 2>&1; then
    if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
      info "'${input_program}' is installed ..."
    fi
  else
    die "Could not find '${input_program}' in PATH. Make sure it is installed and is in your PATH"
  fi
}

validate_version() {
  local version="${1}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Validating version formatting ..."
  fi
  if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    die "invalid version format: '${version}' (expected x.x.x)"
  fi
}

compare_versions() {
  local current_version="${1}"
  local new_version="${2}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Comparing version values ..."
  fi
  if [[ "${current_version}" == "${new_version}" ]]; then
    die "New version is the same as current version (${current_version})"
  fi
}

check_version_updated() {
  local current_version="${1}"
  local new_version="${2}"
  local matches
  matches="$(git grep --no-color --ignore-case --name-only --fixed-strings "${current_version}" || true)"
  if [[ -z "${matches}" ]]; then
    if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
      success "No occurrences of current version: '${current_version}' found"
    fi
  else
    printf "Found occurrences of current version '${current_version}' in the following files:\n"
    printf "%s\n" "${matches}"
    die "You may have not updated the version in every file. Run 'bump-version.sh' to update the version"
  fi
}

cd_directory() {
  local directory="${1}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    info "Moving to directory: '${directory}' ..."
  fi
  cd "${directory}" || die "Cannot move to directory: '${directory}'"
}
