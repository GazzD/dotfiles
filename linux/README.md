# Linux setup (Arch + Hyprland)

This folder has my Linux dotfiles (Arch + Hyprland).

Nothing super fancy here: it is just the setup I use, shared as a base in case it helps you build your own. The main goal is to make it modular and easy to switch without installing or configuring stuff you will never use.

## Directory layout

```text
linux/
├── ghostty/   # Ghostty terminal config
├── hypr/      # Hyprland configs and profile variants
├── satty/     # Screenshot annotation tool
├── system/    # Package snapshot (pkglist)
├── uwsm/      # UWSM environment files
└── zsh/       # Zsh config
```

## Hyprland overview

My Hyprland config is split into two different profiles:

- `hypr/default/hyprland.conf` # Clean functional profile (no shell)
- `hypr/caelestia/hyprland.conf` # Caelestia shell bindings

The Hyprland setup is modular and split by concern (`env`, `input`, `general`, `rules`, etc.), which makes it easier to maintain and override.

## Quick usage

If you want to try this setup, copy or symlink only what you need. Useful target paths:

- `linux/hypr/` -> `~/.config/hypr/`
- `linux/ghostty/` -> `~/.config/ghostty/`
- `linux/satty/` -> `~/.config/satty/`
- `linux/uwsm/` -> `~/.config/uwsm/`
- `linux/zsh/` -> usually `~/.config/zsh/` and/or `~/.zshrc` flow, depending on your setup

## Package snapshot

- File: `linux/system/pkglist.txt`
- Purpose: reference list of packages installed on my machine

It is a reference list, not a strict “install everything” requirement.

## Notes

- Some values are hardware-specific (monitors, GPU, peripherals).
- You will likely need to adjust monitor definitions and startup apps.
- Use this as a starting point and make it yours.
