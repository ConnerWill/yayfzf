#!/usr/bin/env bash
#vim:filetype=sh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2155,2034,2154,2059
set -Eeo pipefail

#######################################
# Script metadata
#######################################
readonly REPO_ROOT="$(git rev-parse --show-toplevel)"
readonly SCRIPT_DIR="${REPO_ROOT}/scripts"
readonly SCRIPT_LIB="${SCRIPT_DIR}/lib.sh"
readonly PROG="$(basename "${BASH_SOURCE[0]}")"
readonly SCRIPT_DESCRIPTION="Push yayfzf PKGBUILD(s) to the AUR (stable and git versions)"
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
readonly AUR_STABLE_DIR="${REPO_ROOT}/AUR/yayfzf/yayfzf"
readonly AUR_GIT_DIR="${REPO_ROOT}/AUR/yayfzf-git/yayfzf-git"
readonly GH_REPO="ConnerWill/yayfzf"
readonly PUSH_GIT="${PUSH_GIT:-true}"
readonly CLEANUP="${CLEANUP:-true}"
readonly AUR_REPO_URL="ssh://aur@aur.archlinux.org/yayfzf.git"
readonly AUR_REPO_URL_GIT="ssh://aur@aur.archlinux.org/yayfzf-git.git"
readonly SSH_DIR="${SSH_DIR:-${SSH_HOME:-${HOME}/.ssh}}"
readonly SSH_PRIV_KEY_NAME="Arch_Linux_AUR_Work_Laptop-2026-01-06-ed25519"
readonly SSH_PRIV_KEY_PATH="${SSH_DIR}/${SSH_PRIV_KEY_NAME}"

if [[ -e "${SCRIPT_LIB}" ]]; then
  if ! source "${SCRIPT_LIB}"; then
    die "Unable to source library: ${SCRIPT_LIB}"
  fi
else
  die "Cannot find library file: ${SCRIPT_LIB}"
fi

#######################################
# Functions
#######################################

# Function to clean up directories if they exist and CLEANUP is set
cleanup_dirs() {
  # List of directories to clean
  local dirs=(
    "${AUR_STABLE_DIR}"
    "${AUR_GIT_DIR}"
  )

  # Only proceed if CLEANUP is set and not empty
  if [[ -n "${CLEANUP}" && "${CLEANUP}" != false ]]; then
    for dir in "${dirs[@]}"; do
      if [[ -d "${dir}" ]]; then
        info "Cleaning directory: '${dir}'"
        if rm -rf "${dir:?}"; then
          success "Removed directory: '${dir}'"
        else
          die "Unable to remove directory: '${dir}', Please resolve manually"
        fi
      else
        info "Directory does not exist, skipping: '${dir}'"
      fi
    done
  else
    info "CLEANUP not set. Skipping cleanup.\n"
  fi
}

# Update PKGBUILD and .SRCINFO files and publish
update_pkgbuild() {
  local package_name="${1}"
  local version="${2}"

  if [[ "${package_name}" == "yayfzf" ]]; then
    local commit_msg="[AUTOMATED] Update PKGBUILD for v${version}"
    local aur_dir="${AUR_STABLE_DIR}"
    info "Updating stable PKGBUILD to version ${version}..."
  elif [[ "${package_name}" == "yayfzf-git" ]]; then
    [[ "${PUSH_GIT}" != true ]] && return
    local commit_msg="[AUTOMATED] Update PKGBUILD for git snapshot"
    local aur_dir="${AUR_GIT_DIR}"
    info "Updating git PKGBUILD ..."
  fi

  # Copy canonical PKGBUILD into the cloned AUR repo
  cp "${REPO_ROOT}/AUR/${package_name}/PKGBUILD" "${aur_dir}/PKGBUILD"

  cd_directory "${aur_dir}"

  # Regenerate .SRCINFO
  info "Updating .SRCINFO"
  if [[ -e "${aur_dir}/.SRCINFO" ]]; then
    rm -f "${aur_dir}/.SRCINFO"
  fi
  makepkg --printsrcinfo > "${aur_dir}/.SRCINFO"

  # Commit & push
  git add PKGBUILD .SRCINFO
  git commit -m "${commit_msg}" || info "No changes to commit"
  echo git push origin main

  success "Pushed version: '${package_name}'"

  cd_directory "${REPO_ROOT}"
}

#######################################
# Main
#######################################
is_installed "git"

clone_repo "${AUR_STABLE_DIR}" "${AUR_REPO_URL}"
clone_repo "${AUR_GIT_DIR}" "${AUR_REPO_URL_GIT}"

info "Fetching latest GitHub tag..."
LATEST_TAG="$(get_latest_tag)"
success "Latest tag detected: ${LATEST_TAG}"

is_installed "makepkg"

update_pkgbuild "yayfzf" "${LATEST_TAG}"
update_pkgbuild "yayfzf-git" "${LATEST_TAG}"

cleanup_dirs

success "All done!"
