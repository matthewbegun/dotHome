# Set up windows workspace
# For best results open terminal as admin first to avoid prompts
# Start-Process "wt.exe" -Verb RunAs -ArgumentList "new-tab pwsh"

#region winget

# winget install wrapper that accepts $package and $extra as inputs (put this in $PROFILE)
function winstall($package, $extras="") {
    $cmd = "winget install --id=$package -e --silent --accept-package-agreements --accept-source-agreements $extras"
    Write-Host "Running: $cmd"
    Invoke-Expression $cmd
}

# list of packages to install via winget
$packages = @(
    "Anthropic.ClaudeCode",
    "aria2.aria2",
    "astral-sh.uv",
    "Casey.Just",
    "DEVCOM.JetBrainsMonoNerdFont",
    "DigitalScholar.Zotero",
    "Docker.DockerDesktop",
    "Genivia.ugrep",
    "Genymobile.scrcpy",
    "Git.Git",
    "GitHub.cli",
    "GitHub.GitHubDesktop",
    "Google.Antigravity",
    "JohnMacFarlane.Pandoc",
    "jqlang.jq",
    "Julialang.Juliaup",
    "junegunn.fzf",
    "Logitech.Options",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsTerminal",
    "OpenJS.NodeJS",
    "Posit.Positron",
    "Posit.Quarto",
    "Posit.RStudio",
    "RProject.R",
    "Rustlang.Rustup",
    "SlackTechnologies.Slack",
    "Starship.Starship",
    "Typst.Typst",
    "VideoLAN.VLC",
    "WinDirStat.WinDirStat",
    "ZedIndustries.Zed"
).ForEach({ winstall $_ })

# experimental vscode install 
# winget install --id=Microsoft.VisualStudioCode -e --silent --accept-package-agreements --accept-source-agreements --override "/MERGETASKS='!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath'"

#endregion

#region uv
uv python install 3.13 --default
uv tool install howdoi
uv tool install httpie
uv tool install ipython
uv tool install ruff
uv tool install tldr
uv tool install yq
uv tool install --python 3.13 --with ipython radian
#endregion

#region quarto
quarto install tinytex

#endregion

#region pwsh installs
if (Get-Command Set-PSRepository -ErrorAction SilentlyContinue) {
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}
if (Get-Command Set-PSResourceRepository -ErrorAction SilentlyContinue) {
Set-PSResourceRepository -Name PSGallery -Trusted
}
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Enable-ExperimentalFeature PSFeedbackProvider
Install-PSResource -Name Microsoft.WinGet.CommandNotFound

# or one completer to rule them all? <-- docs broken, bet it was all written with ai check back sometime
# # Install from PowerShell Gallery (recommended)
# Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
# Install-Module PSPredictor -Scope CurrentUser
#endregion


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

#region vscode
# need to automate installing non-marketplace extensions somehow
code --install-extension https://github.com/mvuorre/vscode-zotero/releases/download/v0.2.0/zotero-0.2.0.vsix
#endregion

#region dotfiles
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/matthewbegun/dotHome/main/Microsoft.PowerShell_profile.ps1' -OutFile $PROFILE -UseBasicParsing -Verbose
# Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/matthewbegun/dotHome/main/podman_completer.ps1' -OutFile "~/.config/podman_completer.ps1" -UseBasicParsing -Verbose
#endregion
