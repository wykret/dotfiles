sudo pacman -Sy wl-clipboard grim slurp hyprland neovim firefox discord zsh waybar swaync rofi-wayland kitty hypridle obs-studio
yay -S swaylock-effects

sudo chmod +x ./lock && cp ./lock ~/.local/bin/lock
sudo chmod +x ./bateria-fracacpp && mv ./bateria-fracacpp ~

mkdir Wallpapers
cp ./wallhaven-p9p6gj_1920x1080.png ~/Wallpapers

cp -r ./.zshenv ~
cp -r ./fastfetch ./kitty ./swaync ./zsh ./waybar ./kitty ./rofi ./hypr ~/.config/
cp -r ./icons ~/.local/share/icons/

