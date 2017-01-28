if status --is-login
	set -e fish_greeting
	set -x fish_user_paths $HOME/.local/bin
	set -x EDITOR nvim
	set -x VISUAL $EDITOR
	set -x N_PREFIX $HOME/.local
end

set -x GPG_TTY (tty)
