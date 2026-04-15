# Linux setup (Arch + Hyprland)

This folder contains my main Linux setup (Arch + Hyprland). The goal is to keep it modular so I can install only what I need and swap pieces without rebuilding the whole environment.

## What is currently updated here

```text
linux/
├── fastfetch/           # System info on shell startup
├── ghostty/             # Ghostty terminal
├── hypr/                # Hyprland, Hypridle, Hyprlock, and scripts
├── illogical-impulse/   # Illogical Impulse config
├── nvim/                # LazyVim-based Neovim setup
├── satty/               # Screenshot annotation config
├── starship/            # Starship prompt
├── sunsetr/             # Screen color temperature
├── system/              # Installed package snapshot
├── thunar/              # Thunar shortcuts and custom actions
├── uwsm/                # UWSM environment files
└── zsh/                 # Zsh + aliases + plugins
```

## Hyprland

The Hyprland setup is split into a shared base and several profiles:

- `shared/`: common rules and variables for every profile
- `default/`: clean and functional profile (no quickshell)
- `caelestia/`: caelestia shell integration configuration
- `ii/`: end4-dots illogical impulse shell configuration

The current selector lives in `linux/hypr/.config/hypr/hyprland.conf`, where `\$profile = ii`.

Besides the window manager itself, this package also includes:

- `hypridle.conf`
- `hyprlock.conf`
- helper scripts for launchers, screenshots, workspaces, and AI helpers

## Shell and terminal

- **Zsh:** Oh My Zsh + `fzf`, `zsh-syntax-highlighting`, `zsh-autosuggestions`, personal aliases, and startup for `starship`, `mise`, `zoxide`, and `fastfetch`. There is an optional configuration with p10k
- **Ghostty:** `Catppuccin Mocha` theme, transparency, and split keybindings.
- **Starship:** prompt kept in its own package so it can be installed without pulling in the full shell setup.

## Editor

- **Neovim:** LazyVim-based configuration in `nvim/.config/nvim`.

## Reference files

- `system/pkglist.txt`: list of packages installed on my machine. It is a reference, not a required install list.

## Installation with GNU Stow

### Requirements

```bash
sudo pacman -S stow
```

### Install packages that link into `$HOME`

```bash
cd /path/to/dotfiles
stow -d linux -t "$HOME" fastfetch ghostty hypr illogical-impulse nvim satty starship sunsetr thunar zsh
```

### Install `uwsm`

Since this package does not mirror `$HOME` directly, it is better to point it to its final directory:

```bash
mkdir -p "$HOME/.config/uwsm"
stow -d linux -t "$HOME/.config/uwsm" uwsm
```

## Common targets

| Package | Target |
| --- | --- |
| `fastfetch` | `~/.config/fastfetch/` |
| `ghostty` | `~/.config/ghostty/` |
| `hypr` | `~/.config/hypr/` |
| `illogical-impulse` | `~/.config/illogical-impulse/` |
| `nvim` | `~/.config/nvim/` |
| `satty` | `~/.config/statty/` |
| `starship` | `~/.config/starship.toml` |
| `sunsetr` | `~/.config/sunsetr/` |
| `thunar` | `~/.config/Thunar/` |
| `uwsm` | `~/.config/uwsm/` |
| `zsh` | `~/.zshrc` and `~/.p10k.zsh` |

## Notes

- Some values are hardware-specific, especially monitors, startup apps, and peripherals.
- Before linking anything, check whether you already have conflicting files.
- The best way to use this setup is package by package, adjusting as you go.
