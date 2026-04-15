<h1 align="center">⚠️ THE ULTIMATE DOTFILES (WIP) ⚠️</h1>
<h3 align="center">✨ Arch Linux + Hyprland | Windows 11 Setup ✨</h3>

<p align="center">
just my personal daily setup dotfiles 👀
</p>

---

## 🖼️ Screenshot

![My Desktop Screenshot](screenshot.png) _I still need to upload one 😅._

### Linux (Arch + Hyprland)

These are the Linux modules currently tracked here:

- `fastfetch`
- `ghostty`
- `hypr`
- `illogical-impulse`
- `nvim`
- `satty`
- `starship`
- `sunsetr`
- `system` (`pkglist.txt` as a reference)
- `thunar`
- `uwsm`
- `zsh`

### Windows (Komorebi + YASB + terminal/editor tooling)

These are the Windows modules currently tracked here:

- `fastfetch`
- `komorebi`
- `powershell`
- `wezterm`
- `yasb`

## Structure

```text
.
├── linux/     # Arch Linux + Hyprland setup
└── windows/   # Windows configuration
```

## Installation with GNU Stow

[GNU Stow](https://www.gnu.org/software/stow/) is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.

To easily add this config you may need first to install `stow` and back up any existing config you do not want to overwrite.


### Linux

Most Linux packages already follow a structure designed to be linked into `$HOME`.

```bash
sudo pacman -S stow
git clone <your-fork-or-repo> dotfiles
cd dotfiles

stow -d linux -t "$HOME" fastfetch ghostty hypr illogical-impulse nvim satty starship sunsetr thunar zsh
mkdir -p "$HOME/.config/uwsm"
stow -d linux -t "$HOME/.config/uwsm" uwsm
```

`linux/system/` is not installed with stow: it only keeps a reference list of installed packages.

### Windows

On Windows there is no single target root for everything, so it is better to use **stow per package** and point it at the real directory each app uses.

```bash
stow -d windows -t "$KOMOREBI_CONFIG_HOME" komorebi
stow -d windows -t "$HOME/.config/yasb" yasb
stow -d windows -t "$HOME/.config/fastfetch" fastfetch
stow -d windows -t "$HOME/.config/wezterm" wezterm
```

`windows/powershell/profile.ps1` is still better copied or adapted manually to your `$PROFILE`, because the final file name depends on how PowerShell is configured on your system.

## Platform documentation

- 🐧 [linux/README.md](linux/README.md)
- 🪟 [windows/README.md](windows/README.md)

## Notes

- This is a personal setup, not a one-command installer.
- Some paths, monitors, binaries, and apps are specific to my machine.
- The idea is to use these configs as a base and adapt them to your environment.
