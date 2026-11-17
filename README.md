# Sherlock setup files

This repository contains setup scripts for installing the published Sherlock CLI in an isolated Python virtual environment. The scripts install the software and show its help text only; they do **not** search for usernames automatically.

## Linux / macOS

```bash
chmod +x setup_sherlock.sh
./setup_sherlock.sh
```

The script requires Python 3.10 or later. Sherlock is installed into the repository's `.venv/` directory, which is intentionally local and should not be committed.

## Windows PowerShell

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\setup_sherlock.ps1
```

## Verify installation

Linux/macOS:

```bash
.venv/bin/sherlock --help
```

Windows:

```powershell
.\.venv\Scripts\sherlock.exe --help
```

For your own account or an account you are explicitly authorized to assess, consult the official upstream usage documentation and choose the options yourself. Sherlock checks public username availability across social platforms; results can be incomplete or incorrect. Do not use it to profile, monitor, or target people without their permission.

Upstream project: <https://github.com/sherlock-project/sherlock>
