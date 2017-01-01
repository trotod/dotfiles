function v
	if test -f Session.vim; and test (count $argv) -eq 0
		nvim -S
	else
		nvim $argv
	end
end

complete -c v -w vim
