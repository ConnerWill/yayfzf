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
readonly SCRIPT_DESCRIPTION="Build yayfzf docker image"
readonly YAYFZF_DOCKER_TAG="yayfzf"
readonly YAYFZF_DOCKERFILE="${REPO_ROOT}/docker/Dockerfile"

#######################################
# Configuration
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
# Functions
#######################################
docker_run() {
  verbose "Running docker image: '${YAYFZF_DOCKER_TAG}'"
  if docker run --rm --interactive --tty --volume "${PWD}:/workspace" "${YAYFZF_DOCKER_TAG}" yayfzf; then
    success "Ran docker image: '${YAYFZF_DOCKER_TAG}'"
  else
    die "Failed to run docker image: '${YAYFZF_DOCKER_TAG}'"
  fi
}

#######################################
# Main
#######################################
is_installed "git"
is_installed "docker"

cd_directory "${REPO_ROOT}"
bash "${SCRIPT_DIR}/build-dockerfile.sh"
docker_run

success "All done!"
