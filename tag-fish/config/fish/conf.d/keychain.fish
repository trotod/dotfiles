if status --is-interactive
	keychain --agents gpg,ssh --eval --quiet id_rsa 058564BF | source
end
