Install favored nerd fonts from the `pwsh>=7`

```pwsh
& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1'))) -Confirm:$false -Name jetbrains-mono, fira-code, open-dyslexic
```

Install host tools with winget (you know what, just run an admin shell and do this, it will be easier):

```pwsh
# containers
winget install -e --id RedHat.Podman
winget install -e --id RedHat.Podman-Desktop

# git
winget install -e --id Git.Git --source winget
winget install -e --id GitHub.cli
winget install -e --id GitHub.GitHubDesktop

# shell
winget install -e --id Starship.Starship 
'Invoke-Expression (&starship init powershell)' >> $PROFILE

# R
winget install -e --id RProject.R
winget install -e --id Posit.RStudio
winget install -e --id Posit.Quarto
winget install -e --id JohnMacFarlane.Pandoc

# julia
winget install julia -s msstore --accept-source-agreements --accept-package-agreements

# rust
winget install Rustlang.Rustup

# tools
winget install -e --id Typst.Typst
winget install -e --id astral-sh.uv
winget install jqlang.jq
winget install --id aria2.aria2

# uv tools
uv python install --default
uv tool install howdoi
uv tool install httpie
uv tool install ipython
uv tool install ruff
uv tool install tldr
uv tool install yq
uv tool install --python 3.13 radian


```

Configure commands:

```pwsh
# git
git config --global user.name "Matthew Begun"
git config --global user.email "matthew.begun@gmail.com"
git config --global core.autocrlf true

# gh
gh auth login
gh config set editor code

# quarto
quarto install tinytex

# starship
'Invoke-Expression (&starship init powershell)' >> $PROFILE

```

---
This may or may not work unattended:

`curl -o- https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/init_wsl.bash | bash`

Current post setup actions:
```
# gh
apt install gh
gh auth login

# git
#touch ~/.gitignore
echo '**/.ipynb_checkpoints/*' >> .gitignore
git config --global core.excludesfile ~/.gitignore

# install vscode server and so on
code .

```

or not *sigh*
~~# NEW HOTNESS~~


