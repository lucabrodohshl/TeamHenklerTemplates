# Install the teamhenkler beamer theme for the current Windows user, so every
# LaTeX document can use \usetheme{teamhenkler}. Works with MiKTeX and TeX Live.
#
#   powershell -ExecutionPolicy Bypass -File install.ps1
#
# The theme is *copied* (links need admin rights on Windows):
# run the script again after every `git pull`.

$ErrorActionPreference = "Stop"

$Src = Join-Path $PSScriptRoot "Presentation-Latex\teamhenkler"

if (Get-Command initexmf -ErrorAction SilentlyContinue) {
    # --- MiKTeX: own TDS root, registered with MiKTeX ---
    $Root = Join-Path $env:USERPROFILE "texmf"
    $Dest = Join-Path $Root "tex\latex\teamhenkler"
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    Copy-Item -Path (Join-Path $Src "*") -Destination $Dest -Recurse -Force
    initexmf --register-root="$Root" 2>$null
    initexmf --update-fndb
}
elseif (Get-Command kpsewhich -ErrorAction SilentlyContinue) {
    # --- TeX Live: personal tree TEXMFHOME ---
    $Root = (kpsewhich -var-value TEXMFHOME).Trim()
    $Dest = Join-Path $Root "tex\latex\teamhenkler"
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    Copy-Item -Path (Join-Path $Src "*") -Destination $Dest -Recurse -Force
}
else {
    Write-Error "No TeX distribution found (MiKTeX or TeX Live must be installed and on PATH)."
}

Write-Host "copied theme to $Dest"

$Found = kpsewhich beamerthemeteamhenkler.sty
if ($Found) {
    Write-Host "ok: LaTeX finds $Found"
} else {
    Write-Warning "LaTeX does not find the theme yet -- see README, section Troubleshooting."
}
