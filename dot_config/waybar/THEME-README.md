# Waybar TUI Retro Hacker Theme

Configuración de Waybar con estética TUI "retro hacker" inspirada en Omarchy.

## Características

- **Dos paletas de colores:** TokyoNight Storm y Dracula
- **Efectos glow/shadow:** Para ese look cyberpunk retro
- **Borders sutiles:** border-radius de 4px para mantener estética TUI
- **Formato tipo terminal:** CPU, MEM, DSK, TMP con formato bracketed `[CPU 45%]`
- **Animaciones:** Warning pulse y critical blink para estados importantes
- **Hover effects:** Todos los módulos responden al hover con glow aumentado
- **Workspaces con inner glow:** Efecto de "luz interior" en workspace activo

## Temas Disponibles

### TokyoNight Storm (Default)
Paleta oscura con azules, cyans y purples vibrantes. Muy cyberpunk.

### Dracula
Paleta oscura con purple, cyan y pink. Clásico retro hacker.

## Cambiar de Tema

Usa el script incluido:

```bash
# Cambiar a TokyoNight
~/.config/waybar/scripts/executable_waybar-theme.sh tokyonight

# Cambiar a Dracula
~/.config/waybar/scripts/executable_waybar-theme.sh dracula
```

El script automáticamente recarga Waybar.

## Estructura de Archivos

```
waybar/
├── config.jsonc              # Configuración principal
├── style.css                 # Imports de todos los tokens
├── tokens/
│   ├── colors.css            # Paleta activa (TokyoNight por default)
│   ├── colors-tokyonight.css # Paleta TokyoNight Storm
│   ├── colors-dracula.css    # Paleta Dracula
│   ├── state.css             # Estados (warning, critical, etc.)
│   ├── workspace.css         # Estilos de workspaces
│   ├── widget.css            # Estilos de widgets/módulos
│   ├── batt-clock.css        # Battery y clock
│   └── slider.css            # Audio/brightness sliders
├── modules/
│   ├── system.jsonc          # CPU, temperatura (formato TUI)
│   ├── storage.jsonc         # Disco y memoria (formato TUI)
│   └── ...                   # Otros módulos
└── scripts/
    └── executable_waybar-theme.sh  # Theme switcher
```

## Formato TUI

Los módulos de sistema usan formato bracketed inspirado en TUIs:

- `[CPU 45%]` - Uso de CPU
- `[MEM 62%]` - Uso de memoria RAM
- `[DSK 78%]` - Uso de disco
- `[TMP 🌡️]` - Temperatura

Haz click para alternar entre formato compacto y detallado.

## Colores de Estado

### Success (Verde con glow)
- Battery charging
- Power saver mode
- DND disabled

### Warning (Amarillo con pulse)
- High resource usage (>75%)
- Notifications pending
- Idle inhibitor active

### Critical (Rojo con blink)
- Very high resource usage (>90%)
- High temperature
- Network disabled
- Performance mode

## Efectos Visuales

### Glow Effect
Todos los módulos tienen un sutil glow que se intensifica en hover.

### Animations
- **urgent-blink:** Para workspaces urgentes
- **warning-pulse:** Para estados de advertencia
- **critical-blink:** Para estados críticos

### Hover States
Todos los módulos interactivos responden al hover con:
- Aumento de glow/shadow
- Color más brillante en borders
- Transiciones suaves (0.3s ease)

## Personalización

### Ajustar intensidad del glow

En `colors.css` o `colors-dracula.css`, modifica el alpha de los glow colors:

```css
@define-color glow_blue rgba(122, 162, 247, 0.4);  /* 0.4 = 40% opacity */
```

Valores recomendados: 0.3 (sutil) - 0.6 (intenso)

### Cambiar border-radius

Para hacer más cuadrado (más TUI) o más redondeado:

```css
border-radius: 0px;   /* Completamente cuadrado */
border-radius: 4px;   /* Sutilmente redondeado (default) */
border-radius: 8px;   /* Más redondeado */
```

### Agregar más módulos TUI

Sigue el patrón de formato bracketed:

```jsonc
{
  "custom/modulo": {
    "format": "[LABEL {}]",
    "exec": "tu-comando"
  }
}
```

## Troubleshooting

### Waybar no recarga
```bash
killall waybar && waybar &
```

### Los colores no cambian
Asegúrate de que el archivo `colors.css` existe y tiene permisos de lectura.

### Los glows no se ven
Verifica que tu compositor (Hyprland, sway, etc.) soporte box-shadow en GTK.

## Inspiración

- **Omarchy rice:** Estética TUI minimalista
- **TokyoNight:** Paleta de colores cyberpunk
- **Dracula:** Paleta clásica retro
- **TUI apps:** htop, btop, calcurse

## Tips

1. Usa fuentes monoespaciadas (JetBrainsMono Nerd Font recomendada)
2. Combina con terminal transparente para consistencia visual
3. Usa TUIs donde puedas: calcurse, btop, ranger, etc.
4. Ajusta el opacity de los glows según tu gusto personal

---

Hecho con 💙 para la comunidad de ricers
