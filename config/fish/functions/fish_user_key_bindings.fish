#fish_vi_key_bindings

function fish_user_key_bindings
	# jj for changing into normal mode
	bind -M insert -m default jj backward-char force-repaint
end

