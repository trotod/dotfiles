set __fish_git_prompt_showcolorhints true

function fish_prompt --description 'Write out the prompt'
	set -l suffix ' $'
	echo -n -s (set_color blue) (prompt_pwd) (set_color normal) (__fish_git_prompt ' %s') $suffix ' '
end
