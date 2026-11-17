#!/usr/bin/env bash
set -euo pipefail

# Install Sherlock from its published Python package into an isolated venv.
# This setup script only displays the help screen; it does not search for accounts.

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="${ROOT_DIR}/.venv"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: Python 3 is required. Install Python 3.10+ and try again." >&2
  exit 1
fi

python3 - <<'PY'
import sys
if sys.version_info < (3, 10):
    raise SystemExit("Error: Python 3.10 or newer is required.")
PY

python3 -m venv "$VENV_DIR"
"${VENV_DIR}/bin/python" -m pip install --upgrade pip
"${VENV_DIR}/bin/python" -m pip install --upgrade sherlock-project

echo
echo "Sherlock is installed in: ${VENV_DIR}"
echo "Showing command options (no account search is being run):"
"${VENV_DIR}/bin/sherlock" --help

echo
echo "To review the tool's documented usage, run: ${VENV_DIR}/bin/sherlock --help"
echo "Only use Sherlock for your own accounts or accounts you are explicitly authorized to assess."
