#!/usr/bin/env pwsh
#region utf-8
$PSDefaultParameterValues["Out-File:Encoding"] = "UTF8"
$env:PYTHONIOENCODING = "utf-8"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
#endregion

#region PSReadline
# Import-Module PSReadline
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# git
Import-Module posh-git

# uv
(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression

# rust
(& rustup completions powershell) | Out-String | Invoke-Expression

# starship
(& starship completions power-shell) | Out-String | Invoke-Expression

# github cli
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

# winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
    $Local:word = $wordToComplete.Replace('"', '""')
    $Local:ast = $commandAst.ToString().Replace('"', '""')
    winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

# include podman completions from ~/.config/
# if (Test-Path "$env:USERPROFILE/.config/podman_completer.ps1") {
#     . "$env:USERPROFILE/.config/podman_completer.ps1"
# }
# (&podman.exe completion powershell) | Out-String | Invoke-Expression
# Set-Alias docker podman

# docker
Import-Module DockerCompletion

# Post hoc brackets for selection/line - note this is Alt+Shift+9
Set-PSReadLineKeyHandler -Key 'Alt+Enter' `
    -BriefDescription Parenthesize-Selection `
    -LongDescription "Put parenthesis around the selection or entire line and move the cursor to after the closing parenthesis" `
    -ScriptBlock {
    # param($key, $arg)
    $selectionStart = $null
    $selectionLength = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetSelectionState([ref]$selectionStart, [ref]$selectionLength)
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    if ($selectionStart -ne -1) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Replace($selectionStart, $selectionLength, '(' + $line.SubString($selectionStart, $selectionLength) + ')')
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($selectionStart + $selectionLength + 2)
    }
    else {
        [Microsoft.PowerShell.PSConsoleReadLine]::Replace(0, $line.Length, '(' + $line + ')')
        [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
    }
}

function winstall {
    $cmd = "winget install -e --silent --accept-package-agreements --accept-source-agreements $args"
    Write-Host "Running: $cmd"
    Invoke-Expression $cmd
}

function up($package = "--all") {
    $cmd = "winget update $package --accept-package-agreements --accept-source-agreements --silent"
    Write-Host "Running: $cmd"
    Invoke-Expression $cmd
}

function wup  { winget update }



#endregion

#region bashisms
Set-Alias which Get-Command
#endregion

#region environment
# prepend path with local bin
Set-Item -Path Env:Path -Value ("$env:USERPROFILE/.local/bin;" + $Env:Path)
#endregion

#region etc
# aria2c
function dl {
    # aria2c -j16 -s16 -x16 -k2M -c $args
    aria2c.exe --continue --max-concurrent-downloads=16 --max-connection-per-server=16 --min-split-size=4M --split=16 $args

}
function mkcd ($path) {
    New-Item -Type Directory -Path $path -Force
    Set-Location $path
}
set-alias mkd mkcd
set-alias take mkcd


# navigation aliases
function ... {
    Set-Location ../..
}
function .... {
    Set-Location ../../..
}
function ..... {
    Set-Location ../../../..
}
function / {
    Set-Location $HOME/_src
}
Set-Alias .. cd..
Set-Alias \ cd\

# ugrep
Set-Alias grep ugrep

#endregion

#region coding
# r
Remove-Item alias:\r
set-alias r radian

# python
Set-Alias py python
Set-Alias ipy ipython
#endregion

#region candy

Import-Module -Name Microsoft.WinGet.CommandNotFound

# starship
Invoke-Expression (&starship init powershell)
#endregion


