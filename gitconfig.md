# Git Config

In the file ~/.gitconfig (or C:\Users\USERNAME\.gitconfig on Windows),
you can set global Git configration options.

Replace (Your Name) and (Your@Email.Address) with your name and email address.

Example:

```
[user]
	name = (Your Name)
	email = (Your@Email.Address)

[core]
    editor = code
[status]
    branch = true
    showStash = true
    showUntrackedFiles = all
[alias]
    a = add --all
    c = commit -m
    st = status
    s = status -s
    l = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'

[init]
    defaultBranch = main
[remote]
    pushDefault = origin
[push]
    default = current
    autoSetupRemote = true
    followTags = true
[pull]
    default = current
    rebase=false
```

Here you can use the following alias commands:

- `git a` to add/stage all changes
- `git c "message"` to commit with a message
- `git st` to show the status of the reposiutory
- `sit s` to show the status of the repository in a short formant
- `git l` to show the log of the repository in a graph format

You can change the default editor to your preferred code editor.
And other settings if you want to customize your Git experience.

