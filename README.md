# Neovim Configuration

This is my personal Neovim setup, built on **Neovim nightly** using the new `vim.pack` plugin manager.  
The goal is a clean, modular configuration that I can extend or refactor easily.

---

## 📂 Folder Structure

- `init.lua` → Entry point (loads plugins first, then core)
- `core/`
  - `init.lua` → Loads options and keymaps
  - `options.lua` → UI and editor options
  - `keymaps.lua` → Key mappings
- `plugins/`
  - `init.lua` → List of plugins + requires each config
  - `config/` → Individual plugin configs
    - `autopairs.lua`
    - `bufferline.lua`
    - `luasnip.lua`
    - `minipick.lua`
    - `oil.lua`
    - `onedark.lua`
    - `treesitter.lua`
    - `vimtex.lua`
- `LuaSnip/`
  - `tex/` → LaTeX snippets
- `after/ftplugin/`
  - `tex.lua` → Filetype-specific config for TeX
- `spell/` → Custom spellfile (added via `zg`)
- `lua/helperfunc.lua` → Helper functions for snippets

---

## 🚀 Usage

1. Clone this repo into your Neovim config folder:  
   ```bash
   git clone https://github.com/Jeisoul/Nvim-Configuration.git ~/.config/nvim

