#!/bin/bash

BROWSER="firefox"

if [ -z "$1" ]; then
    echo "Uso: play 'canción'"
    exit 1
fi

echo "🔍 Buscando..."

# 1. Obtener URLs y títulos
tmp_list=$(mktemp)
yt-dlp "ytsearch15:$*" --get-title --get-url --cookies-from-browser=$BROWSER --flat-playlist | paste - - > "$tmp_list"

# 2. Selección con fzf
selected_urls=$(fzf --multi --header "TAB: Seleccionar | ENTER: Reproducir" < "$tmp_list" | awk '{print $NF}')
rm "$tmp_list"

[ -z "$selected_urls" ] && exit 0

# 3. Crear archivo de configuración de teclas temporal
input_conf=$(mktemp)
cat <<EOF > "$input_conf"
SPACE cycle pause
p     cycle pause
n     playlist-next
b     playlist-prev
UP    add volume 5
1     add volume 5
DOWN  add volume -5
2     add volume -5
EOF

echo "🚀 Reproduciendo..."

# 4. Reproducción usando --input-conf


echo "$selected_urls" | xargs mpv \
    --no-video \
    --ytdl-raw-options="cookies-from-browser=$BROWSER" \
    --input-conf="$input_conf" \
    --term-osd-bar \
    --term-status-msg="🎵 \${media-title} | [%2P] \${time-pos}/\${duration}" \
    --msg-level=all=status

# Limpiar archivo de teclas al cerrar
rm "$input_conf"
