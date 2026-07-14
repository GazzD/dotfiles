source /usr/share/cachyos-fish-config/cachyos-config.fish

alias dotfiles-sync="$HOME/Projects/dotfiles/scripts/sync.sh"

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
mise activate fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end
