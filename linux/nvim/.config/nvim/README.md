# Neovim

This Neovim configuration is based on [LazyVim](https://github.com/LazyVim/LazyVim) and lives inside my Linux dotfiles.

## What is here

- `init.lua`: entry point
- `lua/config/`: options, keymaps, autocmds, and Lazy bootstrap
- `lua/plugins/`: extra plugins or overrides
- `lazy-lock.json`: plugin lockfile

## Installation with GNU Stow

From the repository root:

```bash
stow -d linux -t "$HOME" nvim
```

That links this folder to:

```text
~/.config/nvim
```

## Note

This setup starts from LazyVim, so its official documentation still applies for base plugins and requirements:

<https://lazyvim.github.io/installation>
