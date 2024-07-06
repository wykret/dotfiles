#[ -z $DISPLAY ] && .local/bin/waynit
fastfetch --logo-type small
ZDOTDIR="$HOME/.config/zsh"

if [ -e /home/lucas/.nix-profile/etc/profile.d/nix.sh ]; then . /home/lucas/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
