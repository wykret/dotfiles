##
## Aliases
##
alias rpc="node ~/repos/arrpc/src"
alias rmin="pacman -Qtdq | sudo pacman -Rns -"
alias al="nvim ~/.config/zsh/aliases.zsh"
alias wab="nvim ~/.config/waybar/config.jsonc"
alias hyconf="nvim ~/.config/hypr/hyprland.conf"
alias hyconfi="nvim ~/.config/hypr/hypridle.conf"
alias convid="ffmpeg -i"
alias lute="source myenv/bin/activate; python -m lute.main"
alias sxiv="swiv -B 'black' -C 'white'"
alias mount='sudo mount'
alias b='acpi -b'
alias osu='env PULSE_LATENCY_MSEC=40 WINEPREFIX=$HOME/.wineosu wine ~/osu\\!/osu\\!.exe'
#alias sudo='doas'
alias run='pnpm run'
alias c="clear"
alias q="exit"
alias bar="killall waybar; waybar&disown"
alias cleanram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias trim_all="sudo fstrim -va"
alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mtar='tar -zcvf' # mtar <archive_compress>
alias utar='tar -zxvf' # utar <archive_decompress> <file_list>
alias z='zip -r' # z <archive_compress> <file_list>
alias uz='unzip' # uz <archive_decompress> -d <dir>
alias sr='source ~/.config/zsh/env.zsh'
alias ..="cd .."
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 
alias mkdir="mkdir -p"
alias fm='ranger'
alias pacin="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias paruin="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro  paru -S"
alias pacrem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias pac="sudo pacman"
alias pacupd="pacman -Qu"
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq); paru -c'
alias installed="grep -i installed /var/log/pacman.log"
alias ls="exa --color=auto --icons"
alias sl="ls"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias cat="bat --color always --plain"
alias grep='grep --color=auto'
alias mv='mv -v'
alias cp='cp -vr'
