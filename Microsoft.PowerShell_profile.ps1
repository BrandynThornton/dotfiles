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