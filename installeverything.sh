sudo pacman -Sy hyprland nvim firefox discord zsh waybar swaync rofi-wayland kitty hypridle obs-studio
yay -S swaylock-effects

sudo chmod +x ./lock && cp ./lock ~/.local/bin/lock
sudo chmod +x ./bateria-fracacpp && mv ./bateria-fracacpp ~

mkdir wallpaper
cp ./wallhaven-p9p6gj_1920x1080.png ~/Wallpapers

cp ./.zshenv ~
cp ./fastfetch ./kitty ./swaync ./zsh ./waybar ./kitty ./rofi ./hypr ~/.config/
cp ./icons ~/.local/share/icons/

