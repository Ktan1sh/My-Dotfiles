source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
	fastfetch
end

function mdpdf
	pandoc --pdf-engine=tectonic $argv -o (string replace -r '\.md$' '.pdf' $argv[1])
end

zoxide init fish | source
starship init fish | source

#--- Abbreviations ---

abbr --add neofetch 'fastfetch'
abbr --add ff 'fastfetch'
abbr --add pdw 'pwd'
abbr --add reboot 'systemctl reboot'
abbr --add v 'vim'
abbr --add config 'cd ~/.config'






set -gx PATH $HOME/.local/bin $PATH

alias ls="eza --icons=always"
alias la="eza -a --icons"
alias ll="eza -lah --icons --git"
alias lt="eza --tree --level=2 --icons"
alias cat='bat'
