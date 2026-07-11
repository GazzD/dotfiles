# 🚀 Quick Start - Waybar TUI Retro Hacker Theme

## Ver el Tema Ahora Mismo

```bash
# Recargar Waybar con el nuevo tema TokyoNight
killall -SIGUSR2 waybar

# O reiniciar completamente
killall waybar && waybar &
```

¡Ya está! El tema TokyoNight Storm está activo por defecto.

---

## Probar el Tema Dracula

```bash
~/.config/waybar/scripts/executable_waybar-theme.sh dracula
```

## Volver a TokyoNight

```bash
~/.config/waybar/scripts/executable_waybar-theme.sh tokyonight
```

---

## Cambios Principales Aplicados

### ✅ Estética Visual
- **Border radius:** 20px → 4px (más TUI, menos redondeado)
- **Borders:** Agregados a todos los módulos con colores del tema
- **Glow effects:** Box-shadow con glow sutil en todos los widgets
- **Hover effects:** Glow intensificado al pasar el mouse

### ✅ Colores
- **TokyoNight Storm:** Azul cyber (#7aa2f7), cyan (#73daca), purple (#bb9af7)
- **Dracula:** Purple (#bd93f9), cyan (#8be9fd), pink (#ff79c6)
- **Estados con glow:** Success (verde), Warning (amarillo), Critical (rojo)
- **Animaciones:** Pulse para warnings, blink para critical

### ✅ Formato TUI
- **CPU:** `[CPU 45%]` en lugar de solo icono
- **Memoria:** `[MEM 62%]` con tooltip detallado
- **Disco:** `[DSK 78%]` con info completa
- **Temperatura:** `[TMP 🌡️]` con formato bracketed

### ✅ Workspaces
- Borders en lugar de fill sólido
- Inner glow en workspace activo (muy cyberpunk!)
- Animación blink en workspaces urgentes

### ✅ Nuevos Scripts
- `waybar-theme.sh` - Cambiar entre TokyoNight/Dracula
- `git-status.sh` - Mostrar estado de git (opcional)
- `updates.sh` - Mostrar updates disponibles (opcional)

---

## Módulos Opcionales (No Activados)

Si quieres agregar módulos extras como uptime, git status, o updates checker:

1. Abre `config.jsonc`
2. Agrega en `include`: `"./modules/tui-extras.jsonc"`
3. Agrega en `modules-left`: módulos deseados
4. Recarga waybar

Ver `TUI-MODULES.md` para más detalles.

---

## Verificar que Todo Funcione

### 1. Waybar se ve diferente?
- Deberías ver borders sutiles y efectos glow
- Los colores deben ser azul/cyan/purple (TokyoNight)
- Border radius más cuadrado (4px)

### 2. Hover funciona?
- Pasa el mouse sobre módulos
- El glow debe intensificarse
- Transición suave (0.3s)

### 3. Click en módulos funciona?
- CPU/MEM/DSK alternan entre formato compacto y detallado
- Clock alterna entre hora y fecha

### 4. Estados de color?
- Battery charging = verde con glow
- Alta CPU/memoria = amarillo con pulse
- Crítico = rojo con blink

---

## Ajustar a tu Gusto

### Intensidad del Glow

Edita `tokens/colors.css` (o `colors-dracula.css`):

```css
/* Menos intenso */
@define-color glow_blue rgba(122, 162, 247, 0.2);

/* Más intenso */
@define-color glow_blue rgba(122, 162, 247, 0.6);
```

### Más/Menos Redondeado

Busca `border-radius` en archivos CSS y cambia:
- `0px` = completamente cuadrado (muy TUI)
- `4px` = sutilmente redondeado (actual)
- `8px` = más redondeado

### Desactivar Animaciones

En `state.css`, comenta las animaciones:
```css
/* animation: warning-pulse 2s ease-in-out infinite; */
```

---

## Troubleshooting

### No veo cambios
```bash
killall waybar && waybar &
```

### Errores en la consola
```bash
waybar -l debug
```

### Glows no se ven
Verifica que tu compositor soporte box-shadow. En Hyprland debería funcionar perfectamente.

### Colores raros
Asegúrate de que `colors.css` existe:
```bash
ls -la ~/.config/waybar/tokens/colors.css
```

---

## Screenshots

Para compartir tu rice:
```bash
# Tomar screenshot de waybar
grim -g "$(slurp -d)" ~/waybar-rice.png
```

---

## Next Steps

1. ✅ **Revisar el tema** - Ya está activo!
2. 📖 **Leer THEME-README.md** - Para entender la estructura
3. 🎨 **Personalizar** - Ajusta colores/glow/radius a tu gusto
4. 🔧 **Agregar módulos** - Ver TUI-MODULES.md para ideas
5. 🚀 **Compartir** - Muestra tu rice en r/unixporn!

---

## Backup

Tu configuración original está respaldada en:
- `tokens/colors-original.css` - Colores originales

Para restaurar:
```bash
cp ~/.config/waybar/tokens/colors-original.css ~/.config/waybar/tokens/colors.css
killall -SIGUSR2 waybar
```

---

¡Disfruta tu nuevo Waybar con estética retro hacker! 🎯

Si tienes preguntas o encuentras bugs, abre un issue o contacta al creador.
