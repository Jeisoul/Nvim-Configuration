# Neovim Configuration

My personal Neovim configuration, written in Lua and organized into small,
modular files.

It uses Neovim's native `vim.pack` package manager rather than an external
plugin manager.

## Requirements

- A Neovim version that provides `vim.pack`
- Git
- Additional external programs may be required by individual plugins:
  - `latexmk` and a TeX distribution for VimTeX
  - Typst and a web browser for Typst previewing

## Installation

Back up any existing Neovim configuration, then clone this repository:

```bash
git clone https://github.com/Jeisoul/Nvim-Configuration.git ~/.config/nvim
```

Start Neovim. Packages declared with `vim.pack.add()` will be installed and
loaded by Neovim.

## Entry Point

The root `init.lua` loads the plugin configuration before the core settings:

```lua
require("plugins")
require("core")
```

## Plugins

Plugins are declared in `lua/plugins/init.lua` using `vim.pack.add()`.

Currently installed plugins:

- [oil.nvim](https://github.com/stevearc/oil.nvim) — filesystem editing
- [mini.pick](https://github.com/echasnovski/mini.pick) — fuzzy picker
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) — snippet engine
- [VimTeX](https://github.com/lervag/vimtex) — LaTeX support
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax parsing and highlighting
- [onedark.nvim](https://github.com/navarasu/onedark.nvim) — color scheme
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) — automatic bracket and quote pairs
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — buffer line
- [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) — live Typst preview in a browser

Most plugin-specific configuration is stored in `lua/plugins/config/`.

## Folder Structure

```text
.
├── init.lua
├── lua
│   ├── core
│   │   ├── init.lua
│   │   ├── keymaps.lua
│   │   └── options.lua
│   ├── plugins
│   │   ├── init.lua
│   │   └── config
│   │       ├── autopairs.lua
│   │       ├── bufferline.lua
│   │       ├── luasnip.lua
│   │       ├── minipick.lua
│   │       ├── oil.lua
│   │       ├── onedark.lua
│   │       ├── preview_typst.lua
│   │       └── vimtex.lua
│   ├── dict.lua
│   └── helperfunc.lua
├── LuaSnip
│   ├── mma
│   ├── tex
│   └── typst
├── after
│   └── ftplugin
│       ├── lua.lua
│       ├── markdown.lua
│       ├── tex.lua
│       └── typst.lua
├── plugin
│   ├── comment.lua
│   ├── floaterminal.lua
│   └── pdf2image.lua
├── doc
├── ftdetect
└── spell
```

### Main directories

- `lua/core/` contains general editor options and key mappings.
- `lua/plugins/` declares packages and loads their configuration.
- `LuaSnip/` contains custom snippets for TeX, Typst, and Mathematica-related text.
- `after/ftplugin/` contains settings applied to individual file types.
- `plugin/` contains custom commands and functionality loaded by Neovim.
- `doc/` contains help documentation for the custom plugins.
- `ftdetect/` contains custom filetype detection.
- `spell/` contains additions to the local spelling dictionary.

## Custom Functionality

This configuration includes local Lua plugins for:

- commenting text
- opening a floating terminal
- converting PDF pages to images

Their help files are stored in `doc/` and can be opened from Neovim with the
corresponding `:help` tags.

## Snippets

Custom LuaSnip snippets are organized by language:

- `LuaSnip/tex/` — LaTeX snippets
- `LuaSnip/typst/` — Typst snippets
- `LuaSnip/mma/` — Mathematica-related utilities or snippets

Parts of the LuaSnip setup were inspired by:

- [LuaSnip documentation](https://github.com/L3MON4D3/LuaSnip)
- [E.J. Mastnak's LuaSnip tutorial](https://ejmastnak.com/tutorials/vim-latex/luasnip/)

The snippets and helper functions in this repository were written for my own
workflow, although some follow common patterns demonstrated in those
resources.

## License

This configuration is released under the [MIT License](LICENSE).
