#wallpaper=~/.config/hypr/wallpaper.jpg
#wallpaper=~/wallpapers/wv01uq0n71qc1.jpeg
#wallpaper=~/wallpaperskitsunebishi/images/00108.png
wallpaper=~/Wallpapers/aktI08q.png
#node ~/repos/arrpc/src &
systemctl --user enable opentabletdriver.service --now &
waybar &
swaybg -i $wallpaper &
hypridle &
#/home/lucas/.local/bin/bateria-fraca &
/home/lucas/bateria-fracacpp &
swaync &
sleep 2
#premid &
