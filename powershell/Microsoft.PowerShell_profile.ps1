# Locations

## my root folder for development things
$devel = "~/devel"

# Start in development folder
Set-Location $devel

# git aliases
function gfa { git fetch --all }
function gst { git status -s }
function gba { git branch -v -a }
function gb { git branch -a }
function gco { git commit -v }
function gpl { git pull -v }
function gpsh { git push -v }
function gc { git commit -v }
function c { cd $devel }

# Set-Alias für VSCodium
function code { flatpak run com.vscodium.codium $args }

# Set-Alias für Vivaldi
function vivaldi { flatpak run com.vivaldi.Vivaldi $args }


# Adding git info about the current git repository by using posh-git module
Import-Module posh-git

$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true
