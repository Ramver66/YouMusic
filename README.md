   # YouMusic
Reproductor de YouTube minimalista para la terminal de Linux. Busca, crea playlists dinámicas con FZF y reproduce solo audio mediante MPV con controles personalizados.

# 🎵 YT-Terminal Player

Un script de Bash potente y ligero para buscar y reproducir música de YouTube directamente desde tu terminal. Diseñado para usuarios de Linux (probado en Kali y Debian) que prefieren la línea de comandos sobre las interfaces pesadas del navegador.

## ✨ Características

- **Búsqueda rápida:** Busca entre los 15 mejores resultados de YouTube.
- **Menú Interactivo:** Utiliza `fzf` para seleccionar una o varias canciones.
- **Modo Playlist:** Al seleccionar varias pistas (con `TAB`), se crea una lista de reproducción automática.
- **Bypass de Bloqueos:** Soporte integrado para cookies de navegador para evitar el error "Sign in to confirm you’re not a bot" (429 Too Many Requests).
- **Control Total:** Atajos de teclado personalizados para volumen, pausa y navegación.

## 🛠️ Requisitos

Asegúrate de tener instaladas las siguientes herramientas:

	
	sudo apt update
	sudo apt install mpv yt-dlp fzf

Nota: Se recomienda mantener yt-dlp actualizado para evitar bloqueos de YouTube.
🚀 Instalación

1 Clona este repositorio o descarga el script:
    bash

    git clone https://github.com/Ramver66/YouMusic
    cd YouMusic

2 Dale permisos de ejecución:

	chmod +x yt-play.sh

3 (Opcional) Muévelo a tu bin para usarlo desde cualquier parte con tan solo escribir el comando "play":

	sudo mv YouPlay.sh /usr/local/bin/play
	sudo chmod +x /usr/local/bin/play

🎮 Controles durante la reproducción

  Tecla		|	   Acción
			
Espacio / p	| Pausar / Reanudar
n 			|	Siguiente canción
b 			|	Canción anterior
1 / ↑	    |	Subir volumen
2 / ↓       |	Bajar volumen
q 			|	Salir del reproductor

📖 Uso
Simplemente ejecuta el comando seguido del nombre del artista o canción:

	play "Melendi"

Usa la tecla TAB para marcar varias canciones en el menú y ENTER para empezar a escucharlas.

⚙️ Configuración de Cookies
Si YouTube bloquea la conexión, el script está configurado para leer las cookies de Firefox. Puedes cambiar el navegador en la variable BROWSER dentro del script (ej. chrome, brave, chromium).
                               
Creado con ❤️ para amantes de la terminal.
