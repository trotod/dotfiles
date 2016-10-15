# Hide the greeting
set -e fish_greeting

# vi mode
fish_vi_key_bindings

# $PATH
set -x fish_user_paths $HOME/.local/bin

# Environmental variables
set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x GPG_TTY (tty)
set -x N_PREFIX $HOME/.local
