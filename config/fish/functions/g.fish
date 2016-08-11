# Alias for git, with none of the manual stuff.
# Copied from https://github.com/thoughtbot/dotfiles/blob/master/zsh/functions/g

function g
	if test (count $argv) -gt 0
		git $argv
	else
		git status
	end
end

complete -c g -w git
