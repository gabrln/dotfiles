#!/usr/bin/env bash
# Get active window info in JSON
info=$(hyprctl activewindow -j)

# Extract fields
class=$(echo "$info" | jq -r '.class // "N/A"')
title=$(echo "$info" | jq -r '.title // "N/A"')
initial_class=$(echo "$info" | jq -r '.initialClass // "N/A"')
initial_title=$(echo "$info" | jq -r '.initialTitle // "N/A"')
address=$(echo "$info" | jq -r '.address // "N/A"')
workspace=$(echo "$info" | jq -r '.workspace.name // "N/A"')

# Format message with bold HTML tags (pango markup supported by notify-send)
msg="<b>Classe (Class):</b> $class\n<b>Título (Title):</b> $title\n<b>Classe Inicial:</b> $initial_class\n<b>Título Inicial:</b> $initial_title\n<b>Endereço (Address):</b> $address\n<b>Área de Trabalho:</b> $workspace"

# Send notification
notify-send -t 8000 -i dialog-information "Informações da Janela Ativa" "$msg"
