# Set up windows workspace
# For best results open terminal as admin first to avoid prompts
# Start-Process "wt.exe" -Verb RunAs -ArgumentList "new-tab pwsh"

#region winget
# TODO: standardise install formate.g. 
# $package = "Posit.RStudio"; $extras=""
# OR $extras = "--override '/MERGETASKS=\"!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath\"'"
# OR $extras = "--source msstore"
# winget install --id=$package $override --exact --silent --accept-package-agreements --accept-source-agreements  
# TODO: consider looping through a list of (packages,extras)

# winget install wrapper that accepts $package and $extra as inputs
function winstall($package, $extras="") {
    $cmd = "winget install --id=$package -e --silent --accept-package-agreements --accept-source-agreements $extras"
    Write-Host "Running: $cmd"
    Invoke-Expression $cmd
}

# node
winstall OpenJS.NodeJS

# containers
winstall RedHat.Podman
winstall RedHat.Podman-Desktop

# git
winstall Git.Git --source winget
winstall GitHub.cli
winstall GitHub.GitHubDesktop

# shell
winstall Starship.Starship 

# R
winstall Postit.Rstudio
winstall Posit.Quarto
winstall JohnMacFarlane.Pandoc

# julia
# winget install julia -s msstore --accept-source-agreements --accept-package-agreements
# msstore uses name, the ids are hashed
winstall 9NJNWW8PVKMN "--source msstore"

# rust
winstall Rustlang.Rustup

# tools
winstall Typst.Typst
winstall astral-sh.uv
winstall install jqlang.jq
winstall aria2.aria2
winstall junegunn.fzf

# experimental vscode install 
winget install --id=Microsoft.VisualStudioCode -e --silent --accept-package-agreements --accept-source-agreements --override "/MERGETASKS='!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath'"

#endregion

#region uv
uv python install --default
uv tool install howdoi
uv tool install httpie
uv tool install ipython
uv tool install ruff
uv tool install tldr
uv tool install yq
uv tool install --python 3.13 radian
#endregion

#region pwsh installs
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Enable-ExperimentalFeature PSFeedbackProvider
Install-PSResource -Name Microsoft.WinGet.CommandNotFound
#end region

#region fonts
& ([scriptblock]::Create((Invoke-WebRequest 'https://to.loredo.me/Install-NerdFont.ps1'))) -Confirm:$false -Name jetbrains-mono, fira-code, open-dyslexic
#endregion

#region git
git config --global user.name "Matthew Begun"
git config --global user.email "matthew.begun@gmail.com"
git config --global core.autocrlf true
#endregion

#region gh
gh auth login
gh config set editor code
#endregion

#region dotfiles
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/matthewbegun/dotHome/main/Microsoft.PowerShell_profile.ps1' -OutFile $PROFILE -UseBasicParsing -Verbose
#endregion
