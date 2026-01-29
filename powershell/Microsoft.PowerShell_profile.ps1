# Locations

## my root folder for development things
$devel = "~/devel"
# $sublimeExecutable = 'C:\Program Files\Sublime Text 3\sublime_text.exe'
# $towerExecutable =  'C:\Users\r.wernicke\AppData\Local\Tower\Tower.exe'
# $zoomExecutable = 'C:\Program Files\Zoom\bin\Zoom.exe'

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

# Quickstart aliases
# Set-Alias slime $sublimeExecutable
# Set-Alias tower $towerExecutable
Set-Alias vivaldi flatpak run com.vivaldi.Vivaldi
# Set-Alias zoom $zoomExecutable

# Set-Alias für Codium
function code { flatpak run com.vscodium.codium $args }


# Adding git info about the current git repository by using posh-git module
Import-Module posh-git

$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true
