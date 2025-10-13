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

# tools
winget install --id Typst.Typst
winget install --id Posit.Quartogit
winget install --id=astral-sh.uv  -e

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


