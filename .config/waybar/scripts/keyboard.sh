#!/bin/bash

layout=$(hyprctl devices | grep -A 4 "by-tech-gaming-keyboard$" | grep "active keymap" | sed 's/.*active keymap: *//' | xargs)

case "$layout" in
    "Portuguese (Brazil)")
        echo "🇧🇷"
        ;;
    "Norwegian")
        echo "🇳🇴"
        ;;
    *)
        echo "❓"
        ;;
esac
