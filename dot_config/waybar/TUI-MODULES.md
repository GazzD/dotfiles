# Módulos TUI Opcionales

Estos módulos adicionales siguen la estética TUI y pueden agregarse a tu Waybar.

## Módulos Disponibles

### 1. Uptime
Muestra cuánto tiempo lleva encendido el sistema.

**Config:**
```jsonc
"custom/uptime": {
  "exec": "uptime -p | sed 's/up //g' | sed 's/ hours/h/g' | sed 's/ hour/h/g' | sed 's/ minutes/m/g' | sed 's/ minute/m/g'",
  "interval": 60,
  "format": "[UP {}]",
  "tooltip": false
}
```

**Display:** `[UP 3h 24m]`

---

### 2. Git Status
Muestra el estado del repositorio git en el directorio actual.

**Config:**
```jsonc
"custom/git": {
  "exec": "~/.config/waybar/scripts/executable_git-status.sh",
  "interval": 5,
  "format": "{}",
  "tooltip": false,
  "return-type": "string"
}
```

**Display:** 
- `[GIT:main 󰄬]` - Branch limpio
- `[GIT:main 󰐕2 󰏬1]` - 2 staged, 1 modified

---

### 3. Package Updates
Muestra el número de actualizaciones disponibles (pacman/yay/paru).

**Config:**
```jsonc
"custom/updates": {
  "exec": "~/.config/waybar/scripts/executable_updates.sh",
  "interval": 3600,
  "format": "{}",
  "tooltip": false,
  "on-click": "alacritty -e sh -c 'paru -Syu; echo Done - Press enter to exit; read'",
  "return-type": "string"
}
```

**Display:**
- `[UPD 󰄬]` - Sin updates
- `[UPD 󰚰 15]` - 15 updates disponibles

**Click:** Ejecuta actualización completa del sistema

---

## Cómo Agregar

### Paso 1: Incluir el módulo en config.jsonc

```jsonc
{
  "include": [
    // ... tus otros includes
    "./modules/tui-extras.jsonc",
  ],
  "modules-left": [
    "custom/uptime",
    "custom/git",
    "custom/updates",
    // ... resto de módulos
  ]
}
```

### Paso 2: Los estilos ya están incluidos

Los estilos CSS para estos módulos ya están en `tokens/widget.css`, no necesitas hacer nada más.

---

## Módulos Adicionales que Puedes Crear

### Weather (Clima)
```jsonc
"custom/weather": {
  "exec": "curl -s 'wttr.in/Madrid?format=%c+%t'",
  "interval": 1800,
  "format": "[WX {}]"
}
```

### Spotify Now Playing
```jsonc
"custom/spotify-tui": {
  "exec": "playerctl metadata --format '[♫ {{ artist }} - {{ title }}]' 2>/dev/null",
  "interval": 2,
  "max-length": 50,
  "on-click": "playerctl play-pause"
}
```

### Network Speed
```jsonc
"custom/netspeed": {
  "exec": "~/.config/waybar/scripts/netspeed.sh",
  "interval": 2,
  "format": "[NET {}]"
}
```

Script `netspeed.sh`:
```bash
#!/usr/bin/env bash
RX1=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
TX1=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
TX2=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
RX=$((($RX2-$RX1)/1024))
TX=$((($TX2-$TX1)/1024))
echo "↓${RX}K ↑${TX}K"
```

### Docker Containers
```jsonc
"custom/docker": {
  "exec": "docker ps -q | wc -l",
  "interval": 10,
  "format": "[🐋 {}]",
  "tooltip": false
}
```

### VPN Status
```jsonc
"custom/vpn": {
  "exec": "pgrep -x openvpn >/dev/null && echo '[VPN 󰌾]' || echo ''",
  "interval": 5,
  "format": "{}"
}
```

---

## Tips para Crear Módulos Custom

1. **Formato Bracketed:** Usa `[LABEL valor]` para consistencia
2. **Colores en CSS:** Asigna colores según tipo:
   - `@primary` (blue) - Info/status
   - `@tertiary` (cyan) - Stats/metrics
   - `@warning` (yellow) - Warnings/git
   - `@success` (green) - Success states
   - `@error` (red) - Errors/critical

3. **Glow Effects:** Ya incluidos en los estilos base

4. **Iconos:** Usa Nerd Fonts para iconos consistentes

5. **Tooltips:** Activa tooltips para info detallada sin cluttering

---

## Estructura Recomendada

Para mantener orden:

```
modules-left:   [distro/launcher] [git] [updates] [storage/system]
modules-center: [power] [workspaces] [idle]
modules-right:  [audio] [network] [battery] [clock] [tray]
```

---

## Troubleshooting

### Script no ejecuta
```bash
chmod +x ~/.config/waybar/scripts/executable_*.sh
```

### Módulo no aparece
Verifica el output del script manualmente:
```bash
~/.config/waybar/scripts/executable_git-status.sh
```

### Colores no se aplican
Recarga waybar:
```bash
killall -SIGUSR2 waybar
```

---

Experimenta y crea tus propios módulos! El cielo es el límite 🚀
