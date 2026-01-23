#!/usr/bin/env bash
set -euo pipefail

WORKSPACE="/workspace"
SCRIPT_NAME="yayfzf"
YAYFZF_PATH="${WORKSPACE}/bin/${SCRIPT_NAME}"

# Ensure script is executable if mounted from host
if [[ -f "${YAYFZF_PATH}" ]]; then
  chmod +x "${YAYFZF_PATH}" || true
fi

exec "${@}"
