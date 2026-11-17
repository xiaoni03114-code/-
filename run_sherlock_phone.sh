#!/usr/bin/env bash
set -euo pipefail

# Sherlock iPhone / a-Shell launcher
# Safe for checking your own username or accounts you are explicitly authorized to review.

if ! command -v apk >/dev/null 2>&1; then
  echo "This launcher is intended for iOS a-Shell / Alpine environment."
  echo "It requires 'apk' to be available."
  exit 1
fi

USER_NAME="${1:-}"
if [[ -z "$USER_NAME" ]]; then
  echo "Usage: ./run_sherlock_phone.sh <username>"
  echo "Example: ./run_sherlock_phone.sh xiaoni03114"
  exit 1
fi

echo "[1/4] Installing system prerequisites..."
apk update >/dev/null 2>&1
apk add --no-cache git python3 py3-pip >/dev/null 2>&1

VENV_DIR="/tmp/sherlock-venv"
if [[ ! -d "$VENV_DIR" ]]; then
  echo "[2/4] Creating Python virtual environment..."
  python3 -m venv "$VENV_DIR"
fi

. "$VENV_DIR/bin/activate"

echo "[3/4] Installing Sherlock..."
python -m pip install --upgrade pip >/dev/null 2>&1
python -m pip install --upgrade sherlock-project >/dev/null 2>&1

echo "[4/4] Running Sherlock for: $USER_NAME"
python -m sherlock --print-found --no-color "$USER_NAME"
