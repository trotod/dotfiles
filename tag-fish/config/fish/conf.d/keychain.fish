if status --is-login
	keychain --agents gpg,ssh --eval --quiet id_rsa id_ed25519 $GPG_KEY | source
end
