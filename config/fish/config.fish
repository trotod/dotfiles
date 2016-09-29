# Hide the greeting
set -e fish_greeting

# vi mode
fish_vi_key_bindings

# Environmental variables
set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x GPG_TTY (tty)
set -x N_PREFIX $HOME/.local

# $PATH
set -x fish_user_paths $HOME/.local/bin $HOME/.bin

# $LS_COLORS
if test \( (tput colors) -eq 256 \) -a \( -f $HOME/.colors/LS_COLORS \)
	eval (dircolors -c $HOME/.colors/LS_COLORS)
end

# Shell aliases
source ~/.config/fish/aliases.fish

# keychain
if status --is-interactive
	keychain --agents gpg,ssh --eval --quiet id_rsa 058564BF | source
end
