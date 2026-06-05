<h1 align="center">dotfiles</h1>
<h3 align="center">Arch Linux + Hyprland | Windows 11</h3>

<p align="center">
  Personal dotfiles managed with <a href="https://www.chezmoi.io/">chezmoi</a>.
</p>

---

## Configs tracked

**Linux (Arch + Hyprland)**

- `hypr` — Hyprland, hypridle, hyprlock
- `ghostty` — terminal
- `fastfetch`
- `nvim` — LazyVim-based
- `satty` — screenshot annotation
- `starship` — shell prompt
- `sunsetr`
- `Thunar`
- `uwsm`
- `zsh`

**Windows**

- `fastfetch`
- `komorebi` — tiling window manager
- `yasb` — status bar
- `wezterm` — terminal
- `powershell` — profile

## Structure

```
dotfiles/
├── .chezmoi.toml.tmpl      # chezmoi config template (per-machine variables)
├── .chezmoiignore          # OS-specific exclusion rules
├── .chezmoitemplates/      # reusable Go templates (e.g. monitor layouts)
├── dot_config/             # maps to ~/.config/
│   ├── hypr/
│   ├── ghostty/
│   ├── fastfetch/
│   ├── nvim/
│   ├── uwsm/
│   ├── satty/
│   ├── sunsetr/
│   └── Thunar/
├── dot_zshrc               # maps to ~/.zshrc
└── windows/                # Windows configs (applied only on Windows)
    └── dot_config/
        ├── fastfetch/
        ├── komorebi/
        ├── yasb/
        ├── wezterm/
        └── powershell/
```

## Installation

### Prerequisites

Install [chezmoi](https://www.chezmoi.io/install/):

```bash
# Arch Linux
sudo pacman -S chezmoi

# Windows (winget)
winget install twpayne.chezmoi
```

### Apply dotfiles

```bash
chezmoi init --apply https://github.com/GazzD/dotfiles.git
```

chezmoi will prompt for any machine-specific variables (email, monitor layout) on first run.

### Add a new config file

```bash
chezmoi add ~/.config/someapp
chezmoi cd          # opens source dir in $EDITOR
chezmoi apply       # deploy changes to $HOME
```

### Edit an existing file

```bash
chezmoi edit ~/.config/someapp/config
chezmoi apply
```

### Sync changes back to source

```bash
chezmoi re-add      # pull any manual edits back into source dir
chezmoi diff        # preview what chezmoi apply would change
```

## Notes

- Machine-specific settings (monitor layout, etc.) live in `.chezmoi.toml.tmpl` and are stored per-machine in `~/.config/chezmoi/chezmoi.toml` — not committed.
- `lazy-lock.json` is intentionally excluded; each machine resolves the latest plugin versions.
- Windows configs are deployed to `~/.config/` (`C:\Users\<user>\.config\`). Apps that require a different path need a manual symlink from their expected location to `~/.config/<app>`.
- The old GNU Stow setup is preserved in the `archive/stow-era` branch.
