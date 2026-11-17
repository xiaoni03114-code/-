# Sherlock setup for Windows PowerShell.
# Installs Sherlock into an isolated venv and displays help only; it performs no account searches.
$ErrorActionPreference = 'Stop'
$Root = $PSScriptRoot
$Venv = Join-Path $Root '.venv'

$Python = Get-Command py -ErrorAction SilentlyContinue
if ($Python) {
    & py -3 --version
    if ($LASTEXITCODE -ne 0) { throw 'Python 3 is required.' }
    & py -3 -m venv $Venv
} else {
    $Python = Get-Command python -ErrorAction SilentlyContinue
    if (-not $Python) { throw 'Python 3.10+ is required. Install it from python.org and retry.' }
    & python --version
    & python -m venv $Venv
}

$VenvPython = Join-Path $Venv 'Scripts\python.exe'
$Sherlock = Join-Path $Venv 'Scripts\sherlock.exe'
& $VenvPython -m pip install --upgrade pip
& $VenvPython -m pip install --upgrade sherlock-project
Write-Host "`nSherlock is installed in: $Venv"
Write-Host 'Showing command options (no account search is being run):'
& $Sherlock --help
Write-Host "`nOnly use Sherlock for your own accounts or accounts you are explicitly authorized to assess."
