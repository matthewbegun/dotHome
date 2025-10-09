Install favored nerd fonts from the `pwsh>=7`

```
& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1'))) -Confirm:$false -Name jetbrains-mono, fira-code, open-dyslexic
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


