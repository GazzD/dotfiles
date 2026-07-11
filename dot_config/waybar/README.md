# 📚 Waybar TUI Retro Hacker - Documentación Completa

## Guías Disponibles

### 🚀 [QUICKSTART.md](./QUICKSTART.md)
**Empieza aquí!** Guía rápida para ver el tema funcionando en segundos.

**Contenido:**
- Recargar Waybar
- Cambiar entre temas
- Verificar que todo funcione
- Ajustes rápidos
- Troubleshooting básico

**Tiempo:** 2-5 minutos

---

### 📖 [THEME-README.md](./THEME-README.md)
Documentación completa del tema y su estructura.

**Contenido:**
- Características del tema
- Estructura de archivos
- Formato TUI y colores
- Personalización avanzada
- Tips y tricks

**Tiempo:** 10-15 minutos

---

### 🔧 [TUI-MODULES.md](./TUI-MODULES.md)
Módulos adicionales opcionales y cómo crearlos.

**Contenido:**
- Uptime, Git Status, Updates checker
- Cómo agregar módulos
- Ideas para módulos custom
- Weather, Spotify, Docker, VPN, etc.
- Troubleshooting de scripts

**Tiempo:** 15-20 minutos

---

### 🎨 [DESIGN-GUIDE.md](./DESIGN-GUIDE.md)
Guía de diseño y recomendaciones para rice completo.

**Contenido:**
- Comparación antes/después
- Características visuales
- Rice completo (terminal, TUIs, compositor)
- Hierarchy de colores
- Tips de diseño
- Inspiración y recursos

**Tiempo:** 20-30 minutos

---

## Quick Reference

### Cambiar Tema
```bash
# TokyoNight Storm (default)
~/.config/waybar/scripts/executable_waybar-theme.sh tokyonight

# Dracula
~/.config/waybar/scripts/executable_waybar-theme.sh dracula
```

### Recargar Waybar
```bash
# Recarga suave
killall -SIGUSR2 waybar

# Reinicio completo
killall waybar && waybar &
```

### Archivos Principales
```
waybar/
├── config.jsonc              # Config principal
├── style.css                 # Imports CSS
├── tokens/
│   ├── colors.css            # Paleta activa
│   ├── colors-tokyonight.css # TokyoNight Storm
│   ├── colors-dracula.css    # Dracula
│   ├── state.css             # Estados (warning, critical)
│   ├── workspace.css         # Workspaces
│   ├── widget.css            # Módulos/Widgets
│   ├── batt-clock.css        # Battery & Clock
│   └── slider.css            # Audio/Brightness sliders
├── modules/
│   ├── system.jsonc          # CPU, Temp (TUI format)
│   ├── storage.jsonc         # Disk, Memory (TUI format)
│   └── tui-extras.jsonc      # Uptime, Git, Updates (opcional)
└── scripts/
    ├── executable_waybar-theme.sh   # Theme switcher
    ├── executable_git-status.sh     # Git status
    └── executable_updates.sh        # Update checker
```

---

## Paletas de Colores

### TokyoNight Storm
```
Background:  #1f2335
Primary:     #7aa2f7 (blue)
Secondary:   #bb9af7 (purple)
Tertiary:    #73daca (cyan)
Success:     #9ece6a (green)
Warning:     #e0af68 (yellow)
Error:       #f7768e (red)
```

### Dracula
```
Background:  #282a36
Primary:     #bd93f9 (purple)
Secondary:   #8be9fd (cyan)
Tertiary:    #ff79c6 (pink)
Success:     #50fa7b (green)
Warning:     #ffb86c (orange)
Error:       #ff5555 (red)
```

---

## Features Highlight

### ✨ Visual
- Border radius: 4px (sutilmente redondeado)
- Borders visibles con colores del tema
- Glow effects en todos los módulos
- Hover effects intensificados
- Animaciones para estados críticos

### 🖥️ TUI Format
- CPU: `[CPU 45%]`
- Memory: `[MEM 62%]`
- Disk: `[DSK 78%]`
- Temperature: `[TMP 🌡️]`

### 🎯 Interactive
- Click en CPU/MEM/DSK alterna formatos
- Click en clock alterna hora/fecha
- Hover intensifica glow
- Tooltips con info detallada

### 🔄 Themes
- TokyoNight Storm (default)
- Dracula (alternativo)
- Switch con un comando
- Recarga automática

---

## Troubleshooting Rápido

### No veo cambios
```bash
killall waybar && waybar &
```

### Colores no cambian
```bash
# Verificar archivo
ls -la ~/.config/waybar/tokens/colors.css

# Re-aplicar tema
~/.config/waybar/scripts/executable_waybar-theme.sh tokyonight
```

### Scripts no ejecutan
```bash
chmod +x ~/.config/waybar/scripts/executable_*.sh
```

### Glow no se ve
Verifica compositor (Hyprland funciona perfectamente).

### Errores en waybar
```bash
waybar -l debug
```

---

## Roadmap de Lectura

### Principiante
1. **QUICKSTART.md** - Ver el tema funcionando
2. Experimentar con ambos temas
3. Ajustar intensidad de glow si es necesario

### Intermedio
1. **THEME-README.md** - Entender estructura
2. Personalizar colores y radius
3. Agregar tooltips personalizados

### Avanzado
1. **TUI-MODULES.md** - Agregar módulos custom
2. **DESIGN-GUIDE.md** - Rice completo
3. Crear tus propios scripts y módulos
4. Integrar con resto del sistema

---

## FAQ

**Q: ¿Puedo usar otros colores?**  
A: Sí! Edita `tokens/colors.css` con tu paleta favorita.

**Q: ¿Cómo desactivo las animaciones?**  
A: Comenta las líneas `animation:` en `tokens/state.css`.

**Q: ¿Funciona en otros WM/Compositores?**  
A: Sí, Waybar funciona en Hyprland, Sway, etc. Los efectos pueden variar.

**Q: ¿Puedo mezclar TokyoNight y Dracula?**  
A: Técnicamente sí, pero no es recomendado para coherencia visual.

**Q: ¿Cómo agrego más temas?**  
A: Crea `colors-tuTema.css` y modifica el script switcher.

**Q: ¿Dónde reporto bugs?**  
A: Abre un issue en tu repo de dotfiles o contacta al autor.

---

## Credits & Inspiration

- **TokyoNight:** Enkia
- **Dracula:** Zeno Rocha
- **Omarchy:** Inspiración TUI aesthetic
- **r/unixporn:** Community inspiration
- **Waybar:** Alexis Rouillard

---

## Contribuciones

Si creas módulos cool o mejoras, considera:
- Compartir en r/unixporn
- PR a tu repo de dotfiles
- Documentar para otros

---

## License

MIT / Free to use and modify

---

## Contacto

Para preguntas, sugerencias o mostrar tu rice:
- GitHub Issues
- Reddit: r/unixporn
- Discord: Linux/ricing communities

---

**¡Disfruta tu Waybar retro hacker!** 🚀

Hecho con 💙 para la comunidad de ricers y TUI enthusiasts.
