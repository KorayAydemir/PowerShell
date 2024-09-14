Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -Function ForwardWord

function fd {
    $code_dir = "$HOME\dev\"
    $path = gci -path $code_dir -name -recurse -directory -depth 2 | fzf
    if ($path) {
        Set-Location $code_dir$path
    }
}

function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

  $out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}
