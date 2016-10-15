if test (tput colors) -eq 256 -a -e $HOME/.config/dircolors
	dircolors -c $HOME/.config/dircolors | source
end
