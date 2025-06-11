if pgrep -x "hypridle" >/dev/null ;then
  killall hypridle
  notify-send "idle terminado" "aperte novamente para abrir"
else
  notify-send "idle aberto"
  hypridle
fi
