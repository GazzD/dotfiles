# Windows setup

This directory contains my Windows desktop and shell tooling configuration.

## Directory layout

```text
windows/
├── fastfetch/    # Fastfetch config
├── komorebi/     # Komorebi window manager + related files
├── powershell/   # PowerShell profile
└── yasb/         # YASB bar config + styles
```

## Core components

- `komorebi/`: tiling WM behavior, workspace rules, app-specific behavior
- `yasb/`: top bar widgets and styling
- `powershell/profile.ps1`: shell customizations

## Suggested target paths

Use these as a reference; exact paths depend on your environment variables and app setup:

- `windows/komorebi/` -> `%KOMOREBI_CONFIG_HOME%` (or your Komorebi config directory)
- `windows/yasb/` -> `%USERPROFILE%\\.config\\yasb\\` (common pattern)
- `windows/powershell/profile.ps1` -> your PowerShell `$PROFILE`

## Notes

- Some options are machine-specific (monitor count, DPI/scaling, app paths).
- Keep backups before replacing existing configs.
- Copy what you need, test, then tweak.
