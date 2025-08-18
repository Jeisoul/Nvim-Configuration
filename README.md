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

## Inspirations

Parts of this configuration, especially the LuaSnip setup, were inspired by the
official [LuaSnip documentation](https://github.com/L3MON4D3/LuaSnip) and
[E.J. Mastnak’s LuaSnip tutorial](https://ejmastnak.com/tutorials/vim-latex/luasnip/).

Snippets and helpers were written by me, though some follow common patterns
demonstrated in those resources.

---

## 📜 License

This configuration is released under the [MIT License](LICENSE) — feel free to use and adapt it.

---

## 🚀 Usage

1. Clone this repo into your Neovim config folder:  
   ```bash
   git clone https://github.com/Jeisoul/Nvim-Configuration.git ~/.config/nvim

