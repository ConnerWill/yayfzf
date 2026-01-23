#!/usr/bin/env bash
#vim:filetype=sh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2155,2034,2154,2059


# Change to false to disable verbose mode
VERBOSE=true

if [[ -z "${NO_COLOR}" ]]; then
  TEXT_RED='\x1B[0;38;5;196m'
  TEXT_YELLOW='\x1B[0;38;5;226m'
  TEXT_GREEN='\x1B[0;38;5;46m'
  TEXT_BLUE='\x1B[38;5;33m'
  TEXT_MAGENTA='\x1B[38;5;201m'
  TEXT_BLACK='\x1B[38;5;0m'
  TEXT_WHITE='\x1B[38;5;15m'
  TEXT_BG_RED='\x1B[48;5;196m'
  TEXT_BG_GREEN='\x1B[48;5;46m'
  TEXT_BG_YELLOW='\x1B[48;5;190m'
  TEXT_BG_BLUE='\x1B[48;5;33m'
  TEXT_BG_PURPLE='\x1B[48;5;93m'
  TEXT_BG_MAGENTA='\x1B[48;5;201m'
  TEXT_BG_CYAN='\x1B[48;5;87m'
  TEXT_BOLD='\x1B[1m'
  TEXT_UNDERLINE='\x1B[4m'
  TEXT_ITALIC='\x1B[3m'
  TEXT_RESET='\x1B[0m'
fi

die() {
  local msg="${1:-}"
  [[ -z "${msg}" ]] && return
  printf '%b%s%b%s%b\n' "${TEXT_BG_RED}${TEXT_WHITE}${TEXT_BOLD}" "  ERROR  " "${TEXT_RESET}${TEXT_RED}" " ${msg}" "${TEXT_RESET}" >&2
}

verbose() {
  local msg="${1:-}"
  [[ -z "${msg}" ]] && return
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    printf '%b%s%b%s%b\n' "${TEXT_BG_MAGENTA}${TEXT_WHITE}${TEXT_BOLD}" " VERBOSE " "${TEXT_RESET}${TEXT_MAGENTA}" " ${msg}" "${TEXT_RESET}"
  fi
}

info() {
  local msg="${1:-}"
  [[ -z "${msg}" ]] && return
  printf '%b%s%b%s%b\n' "${TEXT_BG_BLUE}${TEXT_WHITE}${TEXT_BOLD}" "   INFO  " "${TEXT_RESET}${TEXT_BLUE}" " ${msg}" "${TEXT_RESET}"
}

success() {
  local msg="${1:-}"
  [[ -z "${msg}" ]] && return
  printf '%b%s%b%s%b\n' "${TEXT_BG_GREEN}${TEXT_BLACK}${TEXT_BOLD}" " SUCCESS " "${TEXT_RESET}${TEXT_GREEN}" " ${msg}" "${TEXT_RESET}"
}

get_latest_tag() {
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    printf "\n\n"
    sleep 1
    verbose "Finding latest git tag ..."
  fi
  git fetch --tags --quiet
  git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//'
}

checkout_branch() {
  local branch="${1}"
  verbose "Checking out branch: '${branch}'"
  if ! git checkout "${branch}" >/dev/null 2>&1; then
    die "Unable to checkout branch: ${branch}"
  fi
}

clone_repo() {
  local repo_dir="${1}"
  local repo_url="${2}"
  if [[ ! -d "${repo_dir}" ]]; then
    verbose "Cloning repository ${repo_url} ..."
    git clone "${repo_url}" "${repo_dir}" || die "Failed to clone ${repo_url}"
  fi
}

check_uncommitted_files() {
  local git_status_output
  verbose "Searching for uncommitted changes ..."
  git_status_output="$(git status --porcelain)"
  if [[ -n "${git_status_output}" ]]; then
    info "Files not committed:"
    printf "%s\n" "${git_status_output}"
    die "There are uncommitted changes in this repository"
  else
    if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
      success "Working directory is clean."
    fi
  fi
}

commit_files() {
  local commit_msg="${1}"
  if git add --all --verbose; then
    if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]] && verbose "Added files ..."
    fi
  else
    die "Unable to add files to commit"
  fi

  if git commit --message="${commit_msg}" --verbose; then
    [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]] && verbose "Committed files ..."
  else
    die "Unable to commit files"
  fi

  if git push --verbose; then
    [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]] && verbose "pushing files ..."
  else
    die "Unable to push"
  fi
}

is_installed() {
  local input_program="${1}"
  if [[ -n "${VERBOSE}" && "${VERBOSE}" != false ]]; then
    verbose "Checking if '${input_program}' is installed ..."
  fi
  if command -v "${input_program}" >/dev/null 2>&1; then
    verbose "'${input_program}' is installed ..."
  else
    die "Could not find '${input_program}' in PATH. Make sure it is installed and is in your PATH"
  fi
}

validate_version() {
  local version="${1}"
  verbose "Validating version formatting ..."
  if [[ ! "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    die "invalid version format: '${version}' (expected x.x.x)"
  fi
}

compare_versions() {
  local current_version="${1}"
  local new_version="${2}"
  verbose "Comparing version values ..."
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
    success "No occurrences of current version: '${current_version}' found"
  else
    info "Found occurrences of current version '${current_version}' in the following files:"
    printf "%s\n" "${matches}"
    # TODO: This is running
    #die "You may have not updated the version in every file. Run 'bump-version.sh' to update the version"
  fi
}

cd_directory() {
  local directory="${1}"
  verbose "Moving to directory: '${directory}' ..."
  cd "${directory}" || die "Cannot move to directory: '${directory}'"
}
