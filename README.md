# Homer

![Homer Thinking](https://github.com/chrbirks/homer/raw/master/docs/homer-thinking.gif)

Homer is a home directory manager for your shell. Using [Git][git], it
tracks changes in your home directory configuration from anywhere on

## How It Works

Homer is effectively a Git repo and shell extension manager that is accessible
from anywhere on the machine. It's written entirely in [ZSH][] shell
script, but you don't have to use ZSH to gain its benefits. Homer is actually
nothing more than a set of conventions, some shell scripts to make
complex tasks easier, and some useful/sane defaults for ZSH. Homer's
components are tools that wrap a Git repository and your ZSH
configuration.

Homer is comparable with tools like [GNU Stow][stow], its main
difference is that instead of keeping a directory separate from
`$HOME` and symlinking the necessary files over from some
version-controlled directory when asked, Homer uses the home
directory as a Git repository and ignores any files it doesn't explicitly
track. It also provides ZSH-specific alias and plugin management, which
Stow as a more generalized system does not do. Homer is essentially a tool for
managing any file in your home directory you wish to keep with Git.

### Idempotency

Homer is designed to keep your local machine's configuration in sync
with the configuration that may be stored on a remote Git repository.
This could have changes that are not yet on your machine, and Homer
can pull those changes down, cleanly, without affecting any files that
you may have locally edited.

To update the current home directory with the remote:

```bash
$ homer update
```

You can also update Homer itself, which is basically re-running the
installer script. To do so, run:

```bash
$ homer upgrade
```

[git]: http://git-scm.com
[stow]: http://www.gnu.org/software/stow/
[ZSH]: http://zsh.sourceforge.net/
