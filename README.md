<h1 align="center">dotfiles</h1>
<h3 align="center">Arch Linux + Hyprland | Windows 11</h3>

<p align="center">
  Personal dotfiles managed with <a href="https://www.gnu.org/software/stow/">GNU Stow</a>.
</p>

---

## Configs tracked

**Linux (Arch + Hyprland)**

- `hypr` — Hyprland, hypridle, hyprlock
- `waybar` — status bar
- `walker` + `elephant` — app launcher & backend
- `swaync` — notification center
- `ghostty` — terminal
- `fish` — shell
- `zsh` — shell
- `starship` — shell prompt
- `gtk-3.0` / `gtk-4.0` — theme & appearance
- `fontconfig` — font rendering
- `matugen` — color generation
- `waypaper` — wallpaper manager
- `fastfetch` — system info
- `btop` — system monitor
- `Thunar` — file manager
- `spicetify` — Spotify theme
- `zed` / `micro` — editors
- `lazygit` — git TUI
- `spotify-player` — Spotify TUI client
- `clipse` — clipboard manager
- `calcurse` — calendar
- `weathr` — weather CLI
- `mise` — runtime/package manager
- `xdg-desktop-portal` — desktop portal (Hyprland)
- `nvim` / `helix` — (ready for future config)

**Windows**

- `fastfetch`
- `komorebi` — tiling window manager
- `yasb` — status bar
- `wezterm` — terminal
- `powershell` — profile

## Structure

```
dotfiles/
├── linux/               # stow linux/ -t ~   (on Linux)
│   ├── .config/
│   │   ├── hypr/
│   │   ├── waybar/
│   │   ├── gtk-3.0/
│   │   ├── gtk-4.0/
│   │   ├── fish/
│   │   ├── elephant/
│   │   ├── fontconfig/
│   │   └── …
│   ├── .zshrc
│   └── .gitconfig        # (gitignored — generated from .example)
├── windows/              # stow windows/ -t ~ (on Windows)
│   └── .config/
│       ├── komorebi/
│       ├── yasb/
│       ├── wezterm/
│       └── …
├── secrets/
│   ├── env.sh             # (gitignored — your actual API keys)
│   └── env.sh.example     # template with empty vars
├── scripts/
│   └── deploy.sh          # envsubst + stow
└── .gitignore
```

## Installation

### Prerequisites

```bash
# Arch Linux
sudo pacman -S stow gettext
```

### First-time setup

```bash
git clone https://github.com/GazzD/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles

# Set up secrets
cp secrets/env.sh.example secrets/env.sh
# Edit secrets/env.sh and fill in your API keys / tokens

# Deploy
./scripts/deploy.sh
```

### Deploy (after updates)

```bash
cd ~/Projects/dotfiles
git pull
./scripts/deploy.sh
```

## Secrets

Some config files contain API keys or tokens. These are **excluded from git** via `.gitignore` and generated at deploy time from `.example` files using `envsubst`:

| File | What it needs |
|------|--------------|
| `secrets/env.sh` | Google Calendar OAuth, Spotify client ID, OpenWeatherMap key, git email/name |
| `linux/.gitconfig` | `$GIT_EMAIL`, `$GIT_NAME` |
| `linux/.config/spotify-player/app.toml` | `$SPOTIFY_CLIENT_ID` |
| `linux/.config/calcurse/caldav/config` | `$GOOGLE_CALENDAR_CLIENT_ID`, `$GOOGLE_CALENDAR_CLIENT_SECRET` |
| `linux/.config/waybar/scripts/weather.sh` | `$OPENWEATHERMAP_API_KEY`, `$WEATHER_LATITUDE`, `$WEATHER_LONGITUDE` |

### Add a new config

```bash
cp -r ~/.config/<app> linux/.config/<app>
git add linux/.config/<app>
git commit -m "Add <app> config"
./scripts/deploy.sh
```

## Notes

- Linux and Windows configs are in separate stow packages (`linux/` and `windows/`). Run the appropriate one for your OS.
- `nvim/` and `helix/` are placeholder directories ready for future config.
- Secrets are stored locally in `secrets/env.sh` — never committed.
