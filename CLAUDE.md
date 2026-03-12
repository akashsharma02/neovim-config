# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built on [LazyVim](https://www.lazyvim.org/) with the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.

## Architecture

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/` — Core configuration (loaded automatically by LazyVim):
  - `lazy.lua` — lazy.nvim bootstrap and plugin spec imports
  - `options.lua` — Vim options (4-space indent, winbar, Python host)
  - `keymaps.lua` — Custom keymaps
  - `autocmds.lua` — Custom autocommands
- `lua/plugins/` — Plugin specs (each file returns a lazy.nvim spec table, auto-loaded by lazy.nvim)
- `lazyvim.json` — Tracks enabled LazyVim extras
- `stylua.toml` — Lua formatter config (2-space indent, 120 col width)

## LazyVim Extras Enabled

Configured in `lua/config/lazy.lua` and `lazyvim.json`:
- Languages: Python, C/C++ (clangd), JSON, YAML, CMake
- Coding: yanky, luasnip, mini-snippets
- Editor: snacks_explorer, snacks_picker
- AI: copilot-chat
- DAP: core
- Formatting: black (though conform.lua overrides to use ruff_format)

## Key Customizations

- **Colorscheme**: Kanagawa with transparency and dimmed inactive windows
- **Formatter** (conform.nvim): Python uses isort + ruff_format (120 char lines), Lua uses stylua, JS uses prettier. Format with `<leader>f`.
- **LSP**: clangd configured with utf-16 offset encoding; diagnostic virtual text disabled (use `;e` for float)
- **Navigation**: nvim-tmux-navigation for seamless tmux/nvim pane switching (`<C-h/j/k/l>`)
- **Git**: gitsigns with inline blame enabled; git hunks via `]g`/`[g`
- **Snacks.nvim**: Comprehensive picker/explorer/UI setup (replaces telescope)
- **Python**: venv-selector, nvim-dap-python (debugpy via miniforge3)
- **LaTeX**: vimtex with latexmk building to `build/` directory
- **Claude Code**: claude-code.nvim integration

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim plugin spec. It will be auto-loaded. To override a LazyVim default, use the same plugin name and merge opts.

## Lua Formatting

Run `stylua` for Lua files. Config: 2-space indentation, 120 column width (see `stylua.toml`).
