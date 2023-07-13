#!/usr/bin/env bash
# CONFIG ==============================================================

# Load Git config `[alias]` as top-level aliases.
_git_import_aliases

# Source system-wide rc file.
if [[ -f /etc/gitshrc ]]
then
    source /etc/gitshrc
fi

# Source the user rc file.
if [[ -f $HOME/.gitshrc ]]
then
    source "$HOME/.gitshrc"
fi
