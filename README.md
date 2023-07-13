# Fork Information

This is a fork from [another fork](https://github.com/vlad2/git-sh "GitHub") of
the [original `git-sh` repository](https://github.com/rtomayko/git-sh "GitHub").

# `git-sh`

A customized Bash shell suitable for Git work.

The `git-sh` command starts an interactive Bash shell tweaked for heavy Git
interaction:

-   All Git commands available at top-level (`checkout main` →
    `git checkout main`)
-   All Git aliases defined in the `[alias]` section of `~/.gitconfig` available
    at top-level.
-   Shawn O. Pearce’s excellent Bash completion strapped onto all core commands
    and Git aliases.
-   Custom prompt with current branch, repository, and work-tree-dirty
    indicator.
-   Customizable via `/etc/gitshrc` and `~/.gitshrc` config files; for creating
    aliases, changing the prompt, _etc_.
-   Runs on top of normal Bash (`~/.bashrc`) and Readline (`~/.inputrc`)
    configurations.

## Installation

Install the most recent available version under `/usr/local`:

    $ git clone https://github.com/ankitpati/git-sh.git
    $ cd git-sh/
    $ make
    $ sudo make install

Start a shell with `git-sh`:

    $ git-sh
    main!git-sh> help

Use the `PREFIX` environment variable to specify a different install location.
For example, under `~/bin`:

    $ make install PREFIX=~

## Basic Usage

Typical usage is to change into a Git working copy and then start the shell:

    $ cd mygreatrepo
    $ git sh
    main!mygreatrepo> help

Core Git commands and Git command aliases defined in `~/.gitconfig` can be used
as top-level commands:

    main!mygreatrepo> checkout -b new
    new!mygreatrepo> log -p
    new!mygreatrepo> rebase -i HEAD~10

It’s really just a normal Bash shell, so all commands on `PATH` and any aliases
defined in `~/.bashrc` are also available:

    new!mygreatrepo> ls -l
    new!mygreatrepo> vim somefile

_IMPORTANT: `diff` is aliased to its Git counterpart. To use system versions,
run `command(1)` (`command diff`) or qualify the command (`/bin/diff`)._

## Prompt

The default prompt shows the current branch, a bang (`!`), and the relative path
to the current working directory from the root of the work tree. If the work
tree includes modified files that haven’t yet been staged, a dirty status
indicator (`*`) is also displayed.

The `git-sh` prompt includes ANSI colors when the Git `color.ui` option is
enabled. To enable `git-sh`’s prompt colors explicitly, set the `color.sh`
config value to `auto`:

    $ git config --global color.sh auto

Customize prompt colors by setting the `color.sh.branch`, `color.sh.workdir`,
and `color.sh.dirty` git config values:

    $ git config --global color.sh.branch 'yellow reverse'
    $ git config --global color.sh.workdir 'blue bold'
    $ git config --global color.sh.dirty 'red'
    $ git config --global color.sh.dirty-stash 'red'
    $ git config --global color.sh.repo-state 'red'
    $ git config --global color.sh.upstream-state 'yelow'

See
[Colors in Git](https://git-scm.com/book/sv/v2/Customizing-Git-Git-Configuration#:~:text=Colors%20in%20Git "Git SCM")
for information.

## Customising

Most `git-sh` behavior can be configured by editing the user or system Git
config files (`~/.gitconfig` and `/etc/gitconfig`) either by hand or using
`git-config(1)`. The `[alias]` section is used to create basic command aliases.

The `/etc/gitshrc` and `~/.gitshrc` files are sourced, in that order,
immediately before the shell becomes interactive.

The `~/.bashrc` file is sourced before either `/etc/gitshrc` or `~/.gitshrc`.
Any bash customizations defined there and not explicitly overridden by `git-sh`
are also available.

## Copying

-   Copyright © 2008 [Ryan Tomayko](https://tomayko.com/)
-   Copyright © 2008 [Aristotle Pagaltzis](http://plasmasturm.org/)
-   Copyright © 2006, 2007 [Shawn O. Pearce](mailto:spearce@spearce.org)
-   Copyright © 2023 [Ankit Pati](https://ankitpati.in/)

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License, version 2, as published by the Free
Software Foundation.
