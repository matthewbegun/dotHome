This may or may not work unattended:

`curl -o- https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/init_wsl.bash | bash`

Current post setup actions:
```
# gh
apt install gh
gh auth login

# python tools
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install ruff@latest

# install vscode server and so on
code .

```

or not *sigh*
~~# NEW HOTNESS~~


