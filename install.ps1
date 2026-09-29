# Set up these dotfiles on Windows: zsh (MSYS2's, through pixi) in Windows Terminal and the same
# pixi global toolbox as Linux and macOS.
#   powershell -ExecutionPolicy Bypass -File install.ps1                     from a checkout
#   irm https://raw.githubusercontent.com/Pedrexus/dotfiles/main/install.ps1 | iex
# pixi comes first, chezmoi runs through it once, and `chezmoi apply` does the rest: the files,
# the zsh plugins, the toolbox and zsh itself (run_onchange_after_10-toolbox.ps1.tmpl).
$ErrorActionPreference = 'Stop'

$env:PATH = "$HOME\.pixi\bin;$env:PATH"
if (-not (Get-Command pixi -ErrorAction SilentlyContinue)) {
    Invoke-RestMethod https://pixi.sh/install.ps1 | Invoke-Expression
}

if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot '.chezmoi.toml.tmpl'))) {
    pixi exec chezmoi init --apply --source $PSScriptRoot
} else {
    pixi exec chezmoi init --apply Pedrexus/dotfiles
}
if ($LASTEXITCODE) { throw 'chezmoi could not apply the dotfiles' }

Write-Host 'Windows Terminal now lists a "zsh" profile; make it the default in Settings > Startup.'
