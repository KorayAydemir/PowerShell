Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -Function ForwardWord

function fd {
    $code_dir = "$HOME\dev\"
    $path = gci -path $code_dir -name -recurse -directory -depth 1 | fzf
    if ($path) {
        Set-Location $code_dir$path
    }
}

