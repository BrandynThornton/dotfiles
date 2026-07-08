# App installs, assumes scoop
$scoopExportJson = scoop export | ConvertFrom-Json
if (!($scoopExportJson.apps.Name -contains "neovim")) {
  scoop install neovim
}
if (!($scoopExportJson.apps.Name -contains "jq")) {
  scoop install jq
}
if (!($scoopExportJson.apps.Name -contains "starship")) {
  scoop install starship
}
if (!($scoopExportJson.apps.Name -contains "wezterm")) {
  scoop bucket add extras
  scoop install wezterm
}
if (!($scoopExportJson.apps.Name -contains "Hack-NF")) {
  scoop bucket add nerd-fonts
  scoop install Hack-NF
}
# Configuration files
$nvimConfigPath = Join-Path $env:localappdata "nvim/init.lua"
$nvimGitPath = Join-Path $PSScriptRoot "nvim/init.lua"

if (!(test-path $nvimConfigPath)) {
  New-Item -Type SymbolicLink -Path $nvimConfigPath -Target $nvimGitPath
}

$weztermConfigPath = Join-Path $home ".wezterm.lua"
$weztermGitPath = Join-Path $PSScriptRoot "wezterm/.wezterm.lua"

if (!(test-path $weztermConfigPath)) {
  New-Item -Type SymbolicLink -Path $weztermConfigPath -Target $weztermGitPath
}

$starshipConfigPath = Join-Path $home ".config/starship.toml"
$starshipGitPath = Join-Path $PSScriptRoot "starship/starship.toml"

if (!(test-path $starshipConfigPath)) {
  New-Item -Type SymbolicLink -Path $starshipConfigPath -Target $starshipGitPath
}

if (!($env:Path -contains "Git")) {
    $env:Path += ";$env:localappdata\Programs\Git\bin"
}

function cdd {
    push-location C:\Code-One-THD
}

function b64e ($x) {
    [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($x))
}

function b64d ($x) {
    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($x))
}

Import-Module posh-git
Invoke-Expression (&starship init powershell)
