# Windows setup

This folder contains my desktop and terminal configuration for Windows.

## What is currently updated here

```text
windows/
├── fastfetch/    # Fastfetch
├── komorebi/     # Komorebi + whkd + app rules
├── powershell/   # PowerShell profile
├── wezterm/      # WezTerm terminal
└── yasb/         # YASB bar + styles
```

## Main components

- **Komorebi:** `komorebi.json`, `applications.json`, `komorebi.bar.json`, `whkdrc`, and `komorebi.ahk`.
- **YASB:** top bar with workspaces, active window, clock, weather, media, CPU, memory, language, notifications, and power menu.
- **PowerShell:** minimal UTF-8 profile, helper functions, and `fastfetch` on startup.
- **WezTerm:** OpenGL, translucent background, WSL as the default domain, splits, and pane navigation keybindings.
- **Fastfetch:** visual system summary consistent with the rest of the setup.

## Installation with GNU Stow

On Windows, the most practical approach is to link **each package to its real target**, because not every application uses the same configuration root.

### Examples

```bash
stow -d windows -t "$KOMOREBI_CONFIG_HOME" komorebi
stow -d windows -t "$HOME/.config/yasb" yasb
stow -d windows -t "$HOME/.config/fastfetch" fastfetch
stow -d windows -t "$HOME/.config/wezterm" wezterm
```

### PowerShell

`powershell/profile.ps1` is kept as a plain file in the repo. Depending on your setup, your real profile path may look like:

```powershell
$PROFILE
```

If your actual profile file name is not `profile.ps1`, copy or rename this file manually instead of using stow as-is.

## Common targets

| Package | Suggested target |
| --- | --- |
| `komorebi` | `%KOMOREBI_CONFIG_HOME%` |
| `yasb` | `%USERPROFILE%\.config\yasb\` |
| `fastfetch` | `%USERPROFILE%\.config\fastfetch\` |
| `wezterm` | `%USERPROFILE%\.config\wezterm\` |
| `powershell/profile.ps1` | your `$PROFILE` path |

## Notes

- Some app paths, monitor layouts, and scaling values are specific to my machine.
- Back up existing configs before replacing them.
- On Windows this repo works best when installed component by component, not all at once.
